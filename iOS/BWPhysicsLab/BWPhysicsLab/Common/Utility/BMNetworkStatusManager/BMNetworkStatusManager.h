//
//  BMNetworkStatusManager.h
//  B2BMall
//
//  Created by BobWong on 2017/9/8.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworkReachabilityManager.h>

@interface BMNetworkStatusManager : NSObject

@property (assign, nonatomic, readonly) AFNetworkReachabilityStatus status;  ///< 统一管理网络状态

+ (instancetype)sharedInstance;
- (void)startMonitoring;

@end
