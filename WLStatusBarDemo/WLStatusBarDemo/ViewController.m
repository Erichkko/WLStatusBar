//
//  ViewController.m
//  WLStatusBarDemo
//
//  Created by wanglong on 16/7/2.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "ViewController.h"
#import "WLStatusBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)inforMsg:(id)sender {
    [WLStatusBar showMessage:@"6666"];
}
- (IBAction)successMsg:(id)sender {
    [WLStatusBar showSuccessMessage:@"加载成功"];
}
- (IBAction)errorMsg:(id)sender {
    [WLStatusBar showErrorMessage:@"加载失败"];
}
- (IBAction)loadMsg:(id)sender {
    [WLStatusBar showLoadMessage:@"加载中..."];
}

- (IBAction)hide:(id)sender {
    [WLStatusBar hide];
}
@end
