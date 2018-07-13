//
//  CLVolumeView.m
//  YinYin
//
//  Created by chenliang on 2018/7/12.
//  Copyright © 2018年 China Industrial Bank. All rights reserved.
//

#import "CLVolumeView.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

#define Common_Yellow_Color ([UIColor colorWithRed:1.000 green:0.659 blue:0 alpha:1])
#define WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define HEIGHT ([[UIScreen mainScreen] bounds].size.height)
@implementation CLVolumeView{
    UIView *_bgView;
    UIView *_sliderView;
    float _levelWidth;
}

//单例
+(id)sharedInstance{
    static CLVolumeView *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 5)];
        _bgView.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)show:(float)value{
    //系统音量16个等级，0.0625 * 16 = 1
    int level = value/0.0625;
    
    float vw = CGRectGetWidth(_bgView.frame);//slider宽度
    if (_sliderView) {
        [_sliderView removeFromSuperview];
    }
    _sliderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, vw, 5)];
    _sliderView.backgroundColor = [UIColor whiteColor];
    _bgView.hidden = NO;
    [_bgView addSubview:_sliderView];
    
    _levelWidth = vw/16.0;//16格，每一小格的宽度
    
    if (level > 16)level = 16;
    for (int i=0; i<level; i++) {
        float x = _levelWidth*i;
        UIView *ge = [[UIView alloc]initWithFrame:CGRectMake(x, 0, _levelWidth, 5)];
        ge.backgroundColor = Common_Yellow_Color;
        [_sliderView addSubview:ge];
    }
    
    [[UIApplication sharedApplication].keyWindow addSubview:_bgView];
}
-(void)hidden{
    if (_bgView) {
        _bgView.hidden = YES;
    }
}

@end
