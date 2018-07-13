//
//  CLVolumeManager.h
//  YinYin
//
//  Created by chenliang on 2018/7/12.
//  Copyright © 2018年 China Industrial Bank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CLVolumeManager : NSObject

- (instancetype)initWithParentView:(UIView *)parentView;

-(void)addNotification;
-(void)removeNotification;

@end
