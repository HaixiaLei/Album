//
//  Singleton.h
//  DemonProject
//
//  Created by david on 2018/7/10.
//  Copyright © 2018年 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

extern AppDelegate *mainDelegate;

@interface Singleton : NSObject

+ (Singleton *)shared;//创建单例

- (void)setupNetDetect;//设置网络连接状态监听
- (void)setupTimerFor1Second;//设置1秒的计时器

/*数据保存(永久)*/
@property(nonatomic, copy) NSString *account;//账号
@property(nonatomic, copy) NSString *accountPass;//密码
@property(nonatomic, assign) BOOL logined;


@property(nonatomic, assign) AFNetworkReachabilityStatus netStatus;//网络状态
@end
