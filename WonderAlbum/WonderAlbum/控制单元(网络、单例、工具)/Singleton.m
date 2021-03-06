//
//  Singleton.m
//  DemonProject
//
//  Created by david on 2018/7/10.
//  Copyright © 2018年 david. All rights reserved.
//

#import "Singleton.h"

AppDelegate *mainDelegate;

@implementation Singleton {
    dispatch_source_t sec_timer;
}

+ (Singleton *)shared{
    static Singleton * object = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (object == nil) {
            object = [[Singleton alloc] init];
        }
    });
    return object;
}

#pragma mark -- 监听网络状态的改变，当状态发生改变时，发出通知
- (void)setupNetDetect {
    __weak Singleton *weak = self;
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        weak.netStatus = status;
        [[NSNotificationCenter defaultCenter] postNotificationName:Noti_Network_state_changed object:nil];
    }];

}



#pragma mark -- 创建一个计时器,每1秒执行一次
- (void)setupTimerFor1Second {
    dispatch_queue_t queue = dispatch_get_main_queue();
    sec_timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(sec_timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(sec_timer, ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:Noti_Timer_1second object:nil];
    });
    dispatch_resume(sec_timer);
}


#pragma mark -- 在多少秒之后运行
void runBlockAfter(CGFloat time, dispatch_block_t block) {
    dispatch_time_t after = dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC);
    dispatch_after(after, dispatch_get_main_queue(), ^(void){
        block();
    });
}


#pragma mark SETTER 和 GETTER 方法
- (void)setAccount:(NSString *)account {
    [[NSUserDefaults standardUserDefaults] setObject:account forKey:@"everAccount"];
}
- (NSString *)account {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"everAccount"];
}

- (void)setAccountPass:(NSString *)accountPass {
    [[NSUserDefaults standardUserDefaults] setObject:accountPass forKey:@"everAccountPass"];
}
- (NSString *)accountPass {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"everAccountPass"];
}

- (void)setLottery_link:(NSString *)lottery_link {
    [[NSUserDefaults standardUserDefaults] setObject:lottery_link forKey:@"lottery_link"];
}
- (NSString *)lottery_link {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"lottery_link"];
}

- (void)setService_qq:(NSString *)service_qq {
    [[NSUserDefaults standardUserDefaults] setObject:service_qq forKey:@"service_qq"];
}
- (NSString *)service_qq {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"service_qq"];
}

- (void)setNewcomer_guide:(NSString *)newcomer_guide {
    [[NSUserDefaults standardUserDefaults] setObject:newcomer_guide forKey:@"newcomer_guide"];
}
- (NSString *)newcomer_guide {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"newcomer_guide"];
}

- (void)setService_meiqia:(NSString *)service_meiqia {
    [[NSUserDefaults standardUserDefaults] setObject:service_meiqia forKey:@"service_meiqia"];
}
- (NSString *)service_meiqia {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"service_meiqia"];
}

- (void)setService_wechat:(NSString *)service_wechat {
    [[NSUserDefaults standardUserDefaults] setObject:service_wechat forKey:@"service_wechat"];
}
- (NSString *)service_wechat {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"service_wechat"];
}

- (void)setBusiness_agent:(NSString *)business_agent {
    [[NSUserDefaults standardUserDefaults] setObject:business_agent forKey:@"business_agent"];
}
- (NSString *)business_agent {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"business_agent"];
}

- (void)setDiscount_activity:(NSString *)discount_activity {
    [[NSUserDefaults standardUserDefaults] setObject:discount_activity forKey:@"discount_activity"];
}
- (NSString *)discount_activity {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"discount_activity"];
}
@end












