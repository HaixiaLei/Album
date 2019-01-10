//
//  ViewController.m
//  WonderAlbum
//
//  Created by david on 2019/1/4.
//  Copyright © 2019 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //底部Scroll
    _mainScroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_mainScroll];
    
    _topbar = [[TopBar alloc] initWithFrame:self.view.bounds];
    _topbar.controller = self;
    [self.view addSubview:_topbar];
    
    
    
}





#pragma mark 屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

#pragma mark 状态栏设置
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (BOOL)prefersStatusBarHidden {
    return NO;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view resignKeyBoard];
}

@end
