//
//  BWNetworkKit.m
//  BWiOSProjectFramework
//
//  Created by BobWong on 2017/12/28.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWNetworkKit.h"
#import "BWNetworkConfigure.h"
#import <AFHTTPSessionManager.h>

#define TimeOut 30
static NSString const * URL_BASE = @"http://MyUrl";  // 这种比宏定义的方式更加合理

@implementation BWNetworkKit

#pragma mark - Singleton

+ (BWNetworkKit *)sharedInstance
{
    static BWNetworkKit * _sharedObject = nil;
    static dispatch_once_t pred = 0;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
        _sharedObject.isLog = YES;
    });
    
    return _sharedObject;
}

#pragma mark - POST

- (void)POSTDefaultWithURLString:(NSString *)URLString
                      parameters:(id)parameters
                         success:(void (^)(AFHTTPRequestOperation * operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation * operation, NSError * error))failure
{
    NSString * URLStr = [NSString stringWithFormat:@"%@%@",URL_BASE, URLString];
    
    [self POSTWithURLString:URLStr parameters:parameters success:success failure:failure];
}

- (void)POSTWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(void (^)(AFHTTPRequestOperation * operation, id responseObject))success
                  failure:(void (^)(AFHTTPRequestOperation * operation, NSError * error))failure
{
//    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    AFURLSessionManager *manager = [AFURLSessionManager new];
    
//    manager.requestSerializer.timeoutInterval = TimeOut;
    
    NSDictionary * params = [self constructParamsWithParams:parameters basicParams:[self basicParams]];
    
    if(_isLog){
        NSLog(@"POST请求，请求URL：%@", URLString);
        NSLog(@"请求参数：%@",params);
    }
    
//    [manager POST:URLString parameters:parameters success:^(AFHTTPRequestOperation * operation, id responseObject){
//        if(_isLog){
//            NSLog(@"请求成功:%@",operation.responseString);
//        }
//
//        success(operation,responseObject);
//
//        //        if([responseObject isKindOfClass:[NSData class]]){
//        //            NSDictionary * content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        //            success(operation,content);
//        //        } else {
//        //            success(operation,responseObject);
//        //        }
//    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
//        if(_isLog){
//            NSLog(@"请求失败: %@", error);
//        }
//
//        failure(operation, error);
//    }];
}

- (void)uploadImageURLStr:(NSString *)URLString
                     data:(NSData *)fileData
               parameters:(id)parameters
            progressBlock:(void (^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))progressBlock
                  success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                  failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
//    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
//
//    AFHTTPRequestOperation * operation = [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
//        // 设置时间格式
//        formatter.dateFormat = @"yyyyMMddHHmmss";
//        NSString * str = [formatter stringFromDate:[NSDate date]];
//        NSString * fileName = [NSString stringWithFormat:@"%@.png", str];
//
//        // Append Image Data
//        [formData appendPartWithFileData:fileData name:@"image" fileName:fileName mimeType:@"image/png"];
//    } success:^(AFHTTPRequestOperation *operation, id responseObject)  {
//        if(_isLog){
//            NSLog(@"请求成功 : \n responseString : %@\n responseObject : %@", operation.responseString, responseObject);
//        }
//
//        success(operation,responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if(_isLog){
//            NSLog(@"请求失败: %@", error);
//        }
//
//        failure(operation, error);
//    }];
//
//
//    [operation setUploadProgressBlock:progressBlock];
}

#pragma mark - GET

- (void)GETDefaultWithURLString:(NSString *)URLString
                     parameters:(id)parameters
                        success:(void (^)(AFHTTPRequestOperation * operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation * operation, NSError * error))failure
{
    NSString * URLStr = [NSString stringWithFormat:@"%@%@",URL_BASE, URLString];
    
    [self GETWithURLString:URLStr parameters:parameters success:success failure:failure];
}

- (void)GETWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(AFHTTPRequestOperation * operation, id responseObject))success
                 failure:(void (^)(AFHTTPRequestOperation * operation, NSError * error))failure
{
//    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
//
//    [manager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation * operation, id responseObject){
//        if(_isLog){
//            NSLog(@"请求成功:%@",operation.responseString);
//        }
//
//        success(operation, responseObject);
//    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
//        if(_isLog){
//            NSLog(@"请求失败: %@", error);
//        }
//
//        failure(operation, error);
//    }];
}

#pragma mark - Basic Parameters Construction

- (NSDictionary *)basicParams
{
    NSDictionary * params = @{
                              };
    return params;
}

#pragma mark - Tools

- (NSDictionary *)constructParamsWithParams:(NSDictionary *)requestParams
                                basicParams:(NSDictionary *)basicParams
{
    NSMutableDictionary * params = [NSMutableDictionary dictionaryWithDictionary:basicParams];
    for (NSString * key in requestParams.allKeys) {
        params[key] = requestParams[key];
    }
    
    return params;
}

@end
