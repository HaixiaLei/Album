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
        self.height = ScreenX?(88):(64);
        self.width = ScreenWidth;
        [self buildSelf];
    }
    return self;
}

- (void)buildSelf {
    CGFloat contentHeight = ScreenX?(52):(44);
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-contentHeight, self.width, contentHeight)];
    [self addSubview:_contentView];
    
    _profileBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _contentView.height*1.16, _contentView.height)];
    [_profileBtn setTitle:IF_profile3 forState:0];
    [_profileBtn setTitleColor:ColorHex(0xeeeeee) forState:0];
    _profileBtn.titleLabel.font = IconFontOfSize(28);
    [_contentView addSubview:_profileBtn];
    [_profileBtn addTarget:self action:@selector(onProfile:) forControlEvents:UIControlEventTouchUpInside];
    
    _titleLabel = [[UILabel alloc] initWithFrame:_contentView.bounds];
    [_contentView addSubview:_titleLabel];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = SystemFontBy4(15);
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.text = NSLocalizedString(@"奇幻相册", nil);
    
    
}

- (void)onProfile:(UIButton *)button {
    
}


@end
