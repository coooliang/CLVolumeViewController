//
//  CLVolumeViewController.m
//  YinYin
//
//  Created by chenliang on 2018/7/12.
//  Copyright © 2018年 China Industrial Bank. All rights reserved.
//

#import "CLVolumeViewController.h"
#import "CLVolumeManager.h"

@interface CLVolumeViewController ()

@end

@implementation CLVolumeViewController{
    CLVolumeManager *_volumeManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _volumeManager = [[CLVolumeManager alloc]initWithParentView:self.view];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [_volumeManager addNotification];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [_volumeManager removeNotification];
}
@end
