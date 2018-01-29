//
//  BWNetworkKit.h
//  BWPhysicsLab
//
//  Created by BobWong on 2017/12/28.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AFHTTPRequestOperation;

@interface BWNetworkKit : NSObject

//  Data
@property (nonatomic, assign) BOOL isLog;  //!< 是否打印日志


/**
 *  单例方法
 *  @note 创建网络请求框架的单例对象
 *
 *  @return 单例对象
 */
+ (BWNetworkKit *)sharedInstance;

/**
 *  POST请求
 *  @note 请求的URL上已有URL_BASE
 *
 *  @param URLString 基体的后缀URL文本
 *  @param parameters 请求参数
 *  @param success 成功后的处理
 *  @param failure 失败后的处理
 */
- (void)POSTDefaultWithURLString:(NSString *)URLString
                      parameters:(id)parameters
                         success:(void (^)(AFHTTPRequestOperation * operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation * operation, NSError * error))failure;

/**
 *  POST请求
 *  @note URLString为全路径文本
 *
 *  @param URLString 请求URL文本
 *  @param parameters 请求参数
 *  @param success 成功后的处理
 *  @param failure 失败后的处理
 */
- (void)POSTWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(void (^)(AFHTTPRequestOperation * operation, id responseObject))success
                  failure:(void (^)(AFHTTPRequestOperation * operation, NSError * error))failure;

/**
 *  GET请求
 *  @note 请求的URL上已有URL_BASE
 *
 *  @param URLString 基体的后缀URL文本
 *  @param parameters 请求参数
 *  @param success 成功后的处理
 *  @param failure 失败后的处理
 */
- (void)GETDefaultWithURLString:(NSString *)URLString
                     parameters:(id)parameters
                        success:(void (^)(AFHTTPRequestOperation * operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation * operation, NSError * error))failure;

/**
 *  GET请求
 *  @note URLString为全路径文本
 *
 *  @param URLString URL文本
 *  @param parameters 请求参数
 *  @param success 成功后的处理
 *  @param failure 失败后的处理
 */
- (void)GETWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(AFHTTPRequestOperation * operation, id responseObject))success
                 failure:(void (^)(AFHTTPRequestOperation * operation, NSError * error))failure;

/**
 *  POST图像上传
 *  @note URLString为全路径文本
 *
 *  @param URLString URL文本
 *  @param fileData 图像数据
 *  @param parameters 请求参数
 *  @param progressBlock 进度回调事件
 *  @param success 成功后的处理
 *  @param failure 失败后的处理
 */
- (void)uploadImageURLStr:(NSString *)URLString
                     data:(NSData *)fileData
               parameters:(id)parameters
            progressBlock:(void (^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))progressBlock
                  success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                  failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
