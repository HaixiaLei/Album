//
//  Tools.m
//  DemonProject
//
//  Created by david on 2018/7/23.
//  Copyright © 2018年 david. All rights reserved.
//

#import "Tools.h"

@implementation Tools

#pragma mark 检查网络状态
+ (BOOL)checkNetWork {
    if ([Singleton shared].netStatus == AFNetworkReachabilityStatusNotReachable) {
        return NO;
    }
    return YES;
}


#pragma mark 排列组合
long long A(int m,int n)    //计算A下m上n
{
    long long i,res;
    res = 1;
    for(i=m;i>m-n;i--)
        res *= i;
    return res;
}
long long C(int m,int n)    //计算C下m上n
{
    return A(m,n)/A(n,n);
}

#pragma mark 获取某个月的天数
+ (NSInteger)getDaysInMonth:(NSString *)month OfYear:(NSString *)year{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"]; // 年-月
    NSString * dateStr = [NSString stringWithFormat:@"%@-%@",year,month];
    NSDate * date = [formatter dateFromString:dateStr];
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay
                                   inUnit: NSCalendarUnitMonth
                                  forDate:date];
    return range.length;
}

#pragma mark MBProgressHUD 相关方法
+ (void)showText:(NSString *)text inView:(UIView *)view {
    [Tools showText:text inView:view duration:1.5];
}
+ (void)showText:(NSString *)text inView:(UIView *)view duration:(CGFloat)duration {
    [self showText:text duration:duration inView:view];
}
+ (void)showText:(NSString *)text {
    [Tools showText:text duration:1.5];
}
+ (void)showText:(NSString *)text duration:(CGFloat)duration {
    [self showText:text duration:duration inView:[UIApplication sharedApplication].keyWindow];
}

+ (void)showText:(NSString *)text duration:(CGFloat)duration inView:(UIView *)inView {
    if (!text.length) {
        return;
    }
    dispatch_async(dispatch_get_main_queue(),^{
        __block MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:inView animated:YES];
        hud.userInteractionEnabled = NO;
        hud.mode = MBProgressHUDModeText;
        hud.label.text = text;
        hud.label.numberOfLines = 0;
        
        __weak typeof(hud) wh = hud;
        runBlockAfter(duration, ^{
            [wh hideAnimated:YES];
            [MBProgressHUD hideHUDForView:mainDelegate.window.rootViewController.view animated:YES];
            [MBProgressHUD hideHUDForView:mainDelegate.window animated:YES];
            [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
        });
    });
}

#pragma mark 返回半年前的那一天
+ (NSDate *)dateOfHalfYearAgo {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:currentDate];
    NSInteger month = currentDate.month-6;
    NSInteger year = currentDate.year;
    NSInteger day = currentDate.day;
    if (month < 1) {
        month = components.month+12-6;
        --year;
    }
    
    //如果是2月份，要看看有没有超出2月份的天数....
    if (month == 2) {
        NSInteger maxDayIn2 = [Tools getDaysInMonth:[NSString stringWithFormat:@"%li",month] OfYear:[NSString stringWithFormat:@"%li",year]];
        if (maxDayIn2 < day) {
            day = maxDayIn2;
        }
    }
    [components setDay:day];
    [components setMonth:month];
    [components setYear:year];
    NSDate *halfAgoDate = [[NSCalendar currentCalendar] dateFromComponents:components];
    return halfAgoDate;
}

#pragma mark 弹出一个UIAlertController
+ (void)alertWithTitle:(NSString *)title message:(NSString *)message handle:(void (^ __nullable)(UIAlertAction *action))handler cancel:(NSString *)cancel confirm:(NSString *)confirm {
    [self alertWithTitle:title message:message cancel:cancel cancelHandle:NULL confirm:confirm confirmHandle:handler];
}

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message cancel:(NSString *)cancel cancelHandle:(void (^ __nullable)(UIAlertAction *action))cancelHandle confirm:(NSString *)confirm  confirmHandle:(void (^ __nullable)(UIAlertAction *action))confirmHandle {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (cancel.length) {
        [alert addAction:[UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleDefault handler:cancelHandle]];
    }
    if (confirm.length) {
        [alert addAction:[UIAlertAction actionWithTitle:confirm style:UIAlertActionStyleDestructive handler:confirmHandle]];
    }
    
    if (mainDelegate.window.rootViewController.presentedViewController) {
        [mainDelegate.window.rootViewController.presentedViewController presentViewController:alert animated:true completion:nil];
    } else {
        [mainDelegate.window.rootViewController presentViewController:alert animated:true completion:nil];
    }
}




#pragma mark 以某个格式 返回某个日期的 字符串
+ (NSString *)getDateString:(NSDate *)date withFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:0];
//    [formatter setTimeZone:GTMzone];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}
+ (NSDate *)getDate:(NSString *)dateStr withFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:0];
//    [formatter setTimeZone:GTMzone];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateStr];
}





//获取当前时间戳
+ (NSString *)timeStramp {
    long time = [[NSDate date] timeIntervalSince1970];
    NSString *timeStamp = [NSString stringWithFormat:@"%li",time];
    return timeStamp;
}

+ (NSString *)timeStringForSeconds:(long)seconds {
    long min = seconds/60;
//    NSLog(@"============>%li",seconds);
    //小时以上处理
    if (min>59) {
        long hour1 = seconds/3600;
        seconds = seconds%3600;
        long min1 = seconds/60;
        int sec1 = seconds%60;
        
        NSString *hourStr1 = @"";
        NSString *minStr1 = @"";
        NSString *secStr1 = @"";
        if (hour1 > 9) {
            hourStr1 = [NSString stringWithFormat:@"%li",hour1];
        } else {
            hourStr1 = [NSString stringWithFormat:@"0%li",hour1];
        }
        if (min1 > 9) {
            minStr1 = [NSString stringWithFormat:@"%li",min1];
        } else {
            minStr1 = [NSString stringWithFormat:@"0%li",min1];
        }
        if (sec1 > 9) {
            secStr1 = [NSString stringWithFormat:@"%i",sec1];
        } else {
            secStr1 = [NSString stringWithFormat:@"0%i",sec1];
        }
        return [NSString stringWithFormat:@"%@:%@:%@",hourStr1,minStr1,secStr1];
    }
    
    //少于1小时处理
    int sec = seconds%60;
    NSString *minStr = @"";
    NSString *secStr = @"";
    if (min > 9) {
        minStr = [NSString stringWithFormat:@"%li",min];
    } else {
        minStr = [NSString stringWithFormat:@"0%li",min];
    }
    if (sec > 9) {
        secStr = [NSString stringWithFormat:@"%i",sec];
    } else {
        secStr = [NSString stringWithFormat:@"0%i",sec];
    }
    return [NSString stringWithFormat:@"%@:%@",minStr,secStr];
}

//加载gif
+ (UIImage *)gifChangeToImageWithName:(NSString *)name interval:(NSTimeInterval) duration
{
    NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]] pathForResource:name ofType:@"gif"];
    NSData  *data = [NSData dataWithContentsOfFile:filePath];
    if (!data)
    {
        return nil;
    }
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    size_t count = CGImageSourceGetCount(source);
    UIImage *animatedImage;
    if (count <= 1)
    {
        animatedImage = [[UIImage alloc] initWithData:data];
    }
    else
    {
        NSMutableArray *images = [NSMutableArray array];
        for (size_t i = 0; i < count; i++)
        {
            CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
            if (!image)
            {
                continue;
            }
            duration += [Tools frameDurationAtIndex:i source:source];
            [images addObject:[UIImage imageWithCGImage:image scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
            CGImageRelease(image);
        }
        if (!duration)
        {
            duration = (1.0f / 10.0f) * count;
        }
        animatedImage = [UIImage animatedImageWithImages:images duration:duration];
    }
    CFRelease(source);
    return animatedImage;
}

+ (float)frameDurationAtIndex:(NSUInteger)index source:(CGImageSourceRef)source
{
    float frameDuration = 0.1f;
    CFDictionaryRef cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil);
    NSDictionary *frameProperties = (__bridge NSDictionary *)cfFrameProperties;
    NSDictionary *gifProperties = frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
    NSNumber *delayTimeUnclampedProp = gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    if (delayTimeUnclampedProp)
    {
        frameDuration = [delayTimeUnclampedProp floatValue];
    }
    else
    {
        NSNumber *delayTimeProp = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        if (delayTimeProp)
        {
            frameDuration = [delayTimeProp floatValue];
        }
    }
    if (frameDuration < 0.011f)
    {
        frameDuration = 0.100f;
    }
    CFRelease(cfFrameProperties);
    return frameDuration;
    
}

+ (void)popView:(UIView *)popview inView:(UIView *)inview {
    UIView *cover = [[UIView alloc] initWithFrame:inview.bounds];
    [inview addSubview:cover];
    cover.backgroundColor = ColorHexWithAlpha(0x000000, 0.24);
    [cover addSubview:popview];
    popview.center = cover.center;
    
    popview.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
    [UIView animateWithDuration:0.2 animations:^{
        popview.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.12 animations:^{
            popview.transform = CGAffineTransformIdentity;
        }];
    }];
}

@end
























