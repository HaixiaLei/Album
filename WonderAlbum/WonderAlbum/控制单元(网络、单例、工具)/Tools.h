//
//  Tools.h
//  DemonProject
//
//  Created by david on 2018/7/23.
//  Copyright © 2018年 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject
/*检查网络状态*/
+ (BOOL)checkNetWork;


/*获取某个月份的天数*/
+ (NSInteger)getDaysInMonth:(NSString *)month OfYear:(NSString *)year;

/*MBProgressHud 封装*/
+ (void)showText:(NSString *)text inView:(UIView *)view;
+ (void)showText:(NSString *)text inView:(UIView *)view duration:(CGFloat)duration;
+ (void)showText:(NSString *)text;
+ (void)showText:(NSString *)text duration:(CGFloat)duration;
+ (void)showText:(NSString *)text duration:(CGFloat)duration inView:(UIView *)inView;

/*延迟执行一个block*/
void runBlockAfter(CGFloat time, dispatch_block_t block);

/*找出半年前的那一天*/
+ (NSDate *)dateOfHalfYearAgo;

/*弹出一个UIAlertController*/
+ (void)alertWithTitle:(NSString *)title message:(NSString *)message handle:(void (^ __nullable)(UIAlertAction *action))handler cancel:(NSString *)cancel confirm:(NSString *)confirm;
+ (void)alertWithTitle:(NSString *)title message:(NSString *)message cancel:(NSString *)cancel cancelHandle:(void (^ __nullable)(UIAlertAction *action))cancelHandle confirm:(NSString *)confirm  confirmHandle:(void (^ __nullable)(UIAlertAction *action))confirmHandle;

/*以某个格式 返回某个日期的 字符串*/
+ (NSString *)getDateString:(NSDate *)date withFormat:(NSString *)format;
+ (NSDate *)getDate:(NSString *)dateStr withFormat:(NSString *)format;






//加载gif
+ (UIImage *)gifChangeToImageWithName:(NSString *)name interval:(NSTimeInterval) duration;
+ (float)frameDurationAtIndex:(NSUInteger)index source:(CGImageSourceRef)source;

//获取当前时间戳
+ (NSString *)timeStramp;
+ (NSString *)timeStringForSeconds:(long)seconds;

+ (void)popView:(UIView *)popview inView:(UIView *)inview;

extern long long C(int m,int n);
@end
