//
//  ViewController.h
//  WonderAlbum
//
//  Created by david on 2019/1/4.
//  Copyright © 2019 david. All rights reserved.
//

#import "BasicViewController.h"
#import "TopBar.h"

@interface ViewController : BasicViewController<UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *mainScroll;
@property(nonatomic, strong) TopBar *topbar;


@end

