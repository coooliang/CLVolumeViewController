//
//  CLVolumeView.h
//  YinYin
//
//  Created by chenliang on 2018/7/12.
//  Copyright © 2018年 China Industrial Bank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLVolumeView : NSObject

+(id)sharedInstance;
-(void)show:(float)value;
-(void)hidden;

@end
