//
//  WLStatusBar.m
//  WLStatusBar
//
//  Created by wanglong on 16/7/2.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLStatusBar.h"
#define WLStatusBarFont [UIFont systemFontOfSize:14]
static UIWindow *window_;
NSTimer *timer_;
static CGFloat const statusH = 20.0;
static CGFloat const WLAnimationDuration = 0.25;
static CGFloat const WLMessageDuration = 1.5;
@implementation WLStatusBar

+(void)initWindow
{
    [timer_ invalidate];
    window_.hidden = YES;
    CGRect frame =  CGRectMake(0, -statusH, [UIScreen mainScreen].bounds.size.width, statusH);
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    frame.origin.y = 0;
    [UIView animateWithDuration:WLAnimationDuration animations:^{
        window_.frame = frame;
    }];
    
}

+ (void)showMessage:(NSString *)msg withImage:(UIImage *)image
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.frame = window_.bounds;
    
    button.titleLabel.font = WLStatusBarFont;
    
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [window_ addSubview:button];
   timer_ = [ NSTimer scheduledTimerWithTimeInterval:WLMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}
+(void)showMessage:(NSString *)msg
{
    [self initWindow];
    [self showMessage:msg withImage:nil];
    
}
+(void)showSuccessMessage:(NSString *)msg
{
    [self initWindow];
    
     [self showMessage:msg withImage:[UIImage imageNamed:@"WLStatusBar.bundle/ok"]];
}
+(void)showErrorMessage:(NSString *)msg
{
   [self initWindow];
    
    [self showMessage:msg withImage:[UIImage imageNamed:@"WLStatusBar.bundle/error"]];
}
+(void)showLoadMessage:(NSString *)msg
{
    [self initWindow];
    
    UILabel  *msgLabel = [[UILabel alloc] init];
    msgLabel.frame = window_.bounds;
    msgLabel.text = msg;
    msgLabel.font = WLStatusBarFont;
    msgLabel.textAlignment = NSTextAlignmentCenter;
    msgLabel.textColor = [UIColor whiteColor];
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activityView startAnimating];
    CGFloat labelW = [msg sizeWithAttributes:@{NSFontAttributeName:WLStatusBarFont}].width;
    CGFloat activityViewX = (window_.bounds.size.width - labelW) * 0.5 - 20;
    activityView.center = CGPointMake(activityViewX, 10);
    [window_ addSubview:msgLabel];
    [window_ addSubview:activityView];
}
+(void)hide
{
    CGRect frame = window_.frame;
    frame.origin.y = -statusH;
    [UIView animateWithDuration:WLAnimationDuration animations:^{
        window_.frame = frame;

    } completion:^(BOOL finished) {
                window_ = nil;
                timer_ = nil;
    }];
    
}
@end
