//
//  TopBar.h
//  WonderAlbum
//
//  Created by david on 2019/1/5.
//  Copyright © 2019 david. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TopBar : UIView

@property(nonatomic, assign) UIViewController *controller;//自己的ViewController



@property(nonatomic, strong) UIView *background;//底部的颜色背景
@property(nonatomic, strong) UIView *contentView;
@property(nonatomic, strong) UIButton *profileBtn;
@property(nonatomic, strong) UIButton *personInfoBtn;
@property(nonatomic, strong) UILabel *titleLabel;//顶部标题

@property(nonatomic, assign) CGFloat height0;//没登录之前、滚动的时候的高度
@property(nonatomic, assign) CGFloat height1;//登录之后的高度
@property(nonatomic, assign) CGFloat height2;//登录、注册状态的高度


@end

NS_ASSUME_NONNULL_END
