//
//  CLVolumeManager.m
//  YinYin
//
//  Created by chenliang on 2018/7/12.
//  Copyright © 2018年 China Industrial Bank. All rights reserved.
//

#import "CLVolumeManager.h"

#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "CLVolumeView.h"

@implementation CLVolumeManager{
    NSTimer *_timer;
    
    CLVolumeView *_clv;

}

- (instancetype)initWithParentView:(UIView *)parentView{
    self = [super init];
    if (self) {
        MPVolumeView *volumeView = [[MPVolumeView alloc]initWithFrame:CGRectMake(-1000, -1000, 100,100)];
        [parentView addSubview:volumeView];
        
        [[AVAudioSession sharedInstance] setActive:true error:nil];
    }
    return self;
}

- (void)volumeChanged:(NSNotification *)notification{
    //该消息除了监听音量键之外，应用从后台切换到前台也会发送该消息,确定发送消息的理由
    NSString *reason = [notification.userInfo objectForKey:@"AVSystemController_AudioVolumeChangeReasonNotificationParameter"];
    NSLog(@"reason : %@",reason);
    if([reason isEqualToString:@"ExplicitVolumeChange"]) {
        float vol = [[notification.userInfo objectForKey:@"AVSystemController_AudioVolumeNotificationParameter"] floatValue];
        NSLog(@"volumeChanged vol = %f",vol);
        if (_clv == nil) {
            _clv = [CLVolumeView sharedInstance];
        }
        [_clv show:vol];
        
        if (_timer) {
            [_timer invalidate];
            _timer = nil;
        }
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hidden) userInfo:nil repeats:NO];
    }
}

-(void)hidden{
    NSLog(@"hidden ... ");
    if (_clv) {
        [_clv hidden];
    }
}
-(void)addNotification{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(volumeChanged:) name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];
}
-(void)removeNotification{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];
}
@end
