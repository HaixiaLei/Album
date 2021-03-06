//
//  Defines.h
//  WonderAlbum
//
//  Created by david on 2019/1/4.
//  Copyright © 2019 david. All rights reserved.
//

#ifndef Defines_h
#define Defines_h

/*回调函数*/
typedef void (^Callback)(NSError *error, int code, id response);



/*UI相关宏定义*/

//屏幕宽
#define ScreenWidth          ([UIScreen mainScreen].bounds.size.width)

//屏幕高
#define ScreenHeight         ([UIScreen mainScreen].bounds.size.height)

//设备是ipad
#define IsIpad    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//设备是4寸   640x1136@2x=320x568
#define Screen4_0 (CGSizeEqualToSize(CGSizeMake(320.f, 568.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(568.f, 320.f), [UIScreen mainScreen].bounds.size))

//设备是4.7寸   750x1334@2x=375x667
#define Screen4_7 (CGSizeEqualToSize(CGSizeMake(375.f, 667.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(667.f, 375.f), [UIScreen mainScreen].bounds.size))

//设备是5.5寸  1242x2208@3x=414x736
#define Screen5_5 (CGSizeEqualToSize(CGSizeMake(414.f, 736.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(736.f, 414.f), [UIScreen mainScreen].bounds.size))

//设备是X   5.8:1125x2436@3x=375x812   6.5:1242x2688@3x=414x896    6.1:828x1792@2x=414x896
#define ScreenX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(414.f, 896.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(896.f, 414.f), [UIScreen mainScreen].bounds.size))

//字体大小
#define FontValueBy4(n) (Screen4_7?(1.12*n):(Screen5_5?(1.20*n):(ScreenX?(1.12*n):(IsIpad?(1.5*n):(0.96*n)))))
#define SystemFontBy4(n) ([UIFont systemFontOfSize:(1.0*FontValueBy4(n))])
#define BoldSystemFontBy4(n) ([UIFont boldSystemFontOfSize:(1.0*FontValueBy4(n))])

//比例
#define heightTo4_7(n) (((1.f)*n)/(667.f)*ScreenHeight)
#define widthTo4_7(n) (((1.f)*n)/(375.f)*ScreenWidth)

//iconfont字符
#define IconFontOfSize(n) [UIFont fontWithName:@"iconFont" size: FontValueBy4(n)];


//颜色
#define ColorHexWithAlpha(n,a) ([UIColor colorWithRed:((float)((n &0xFF0000) >> 16))/255.0 green:((float)((n & 0xFF00)>> 8))/255.0 blue:((float)(n & 0xFF))/255.0 alpha:a])
#define ColorHex(n) (ColorHexWithAlpha(n,1.0))






/*通知定义*/
#define Noti_Timer_1second                    @"Noti_Timer_1second"
#define Noti_Network_state_changed            @"Noti_Network_state_changed"


















/*UI相关宏定义*/























#endif /* Defines_h */
