//
//  BWYTKRequest.m
//  BWPhysicsLab
//
//  Created by BobWong on 2018/1/29.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import "BWYTKRequest.h"

@implementation BWYTKRequest {
    NSDictionary *_argument;
}

- (instancetype)initWithRequestArgument:(NSDictionary *)argument {
    self = [super init];
    if (self) {
        _argument = argument;
    }
    return self;
}

- (void)requestWithArgument:(NSDictionary *)argument completionBlockWithSuccess:(YTKRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure {
    _argument = argument;
    [self startWithCompletionBlockWithSuccess:success failure:failure];
}

+ (void)requestWithArgument:(NSDictionary *)argument completionBlockWithSuccess:(YTKRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure {
    [[[self alloc] init] requestWithArgument:argument completionBlockWithSuccess:success failure:failure];
}

- (NSString *)baseUrl {
    return @"http://localhost:8081";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (id)requestArgument {
    return _argument;
}

@end
