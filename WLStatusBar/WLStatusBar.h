//
//  WLStatusBar.h
//  WLStatusBar
//
//  Created by wanglong on 16/7/2.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLStatusBar : NSObject
+(void)showMessage:(NSString *)msg;
+(void)showSuccessMessage:(NSString *)msg;
+(void)showErrorMessage:(NSString *)msg;
+(void)showLoadMessage:(NSString *)msg;
+(void)showMessage:(NSString *)msg withImage:(UIImage *)image;
+(void)hide;
@end
