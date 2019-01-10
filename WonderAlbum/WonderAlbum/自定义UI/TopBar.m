//
//  TopBar.m
//  WonderAlbum
//
//  Created by david on 2019/1/5.
//  Copyright © 2019 david. All rights reserved.
//

#import "TopBar.h"

@implementation TopBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor midnightBlueColor];//背景色
        _height0 = ScreenX?(widthTo4_7(66)):(IsIpad?widthTo4_7(36):widthTo4_7(46));
        _height1 = ScreenX?(widthTo4_7(100)):(IsIpad?widthTo4_7(70):widthTo4_7(80));
        _height2 = ScreenX?(widthTo4_7(450)):(IsIpad?widthTo4_7(420):widthTo4_7(430));
        
        
        CGFloat height = ScreenX?(widthTo4_7(106)):(IsIpad?widthTo4_7(76):widthTo4_7(86));//自身高度
        self.height = height;
        [self buildSelf];
    }
    return self;
}

- (void)buildSelf {
    CGFloat contentHeight = ScreenX?(widthTo4_7(46)):(widthTo4_7(20));
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, contentHeight, self.width, self.height-contentHeight)];
//    _contentView.backgroundColor = [UIColor redColor];
    [self addSubview:_contentView];
    
    CGFloat profile_top = 0.1*_contentView.height;
    CGFloat profile_size = _contentView.height-profile_top*2;
    _profileBtn = [[UIButton alloc] initWithFrame:CGRectMake(profile_top*1.6, profile_top, profile_size, profile_size)];
//    _profileBtn.backgroundColor = [UIColor greenColor];
    [_profileBtn setTitle:IF_profile3 forState:0];
    [_profileBtn setTitleColor:ColorHex(0xeeeeee) forState:0];
    _profileBtn.titleLabel.font = IconFontOfSize(FontValueBy4(32));
    [_contentView addSubview:_profileBtn];
    [_profileBtn addTarget:self action:@selector(onProfile:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onProfile:(UIButton *)button {
    
}


@end
