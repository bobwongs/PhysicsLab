//
//  BWYTKRequest.h
//  BWPhysicsLab
//
//  Created by BobWong on 2018/1/29.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
#import "BWNetworkConfigure.h"

@interface BWYTKRequest : YTKBaseRequest

/// 使用请求参数初始化
- (instancetype)initWithRequestArgument:(NSDictionary *)argument;

// 请求带参数
- (void)requestWithArgument:(NSDictionary *)argument completionBlockWithSuccess:(YTKRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure;
+ (void)requestWithArgument:(NSDictionary *)argument completionBlockWithSuccess:(YTKRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure;

@end
