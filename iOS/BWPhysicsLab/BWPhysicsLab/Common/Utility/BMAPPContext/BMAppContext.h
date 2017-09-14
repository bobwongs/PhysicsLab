//
//  BMAppContext.h
//  BlueMoonBlueHouse
//
//  Created by 冯立海 on 15/9/25.
//  Copyright (c) 2015年 fenglh. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * 描述：每个App都应该拥有的基本属性以及方法
 *
 * 注：该类不允许添加与业务有关的的功能，避免移植时拖泥带水！
 */
@interface BMAppContext : NSObject

@property (nonatomic, strong, readonly) NSString *appName;                //app名字
@property (nonatomic, strong, readonly) NSString *bundleIdendifier;       //bundleId
@property (nonatomic, strong, readonly) NSString *uuidBM;                 //设备唯一标识符
@property (nonatomic, strong, readonly) NSString *clientVersion;          //Version号
@property (nonatomic, strong, readonly) NSString *clientBuild;            //Build号
@property (nonatomic, assign, readonly) NSUInteger appCacheSize;        //缓存大小，单位字节(B)
@property (nonatomic, strong, readonly) NSString *appCacheSizeString;   //缓存大小,保留两位小数。当缓存大小达到MB级时，以BM为单位返回；否则当达到KB级时，以KB为单位返回;否则已B为单位返回.

+ (instancetype)sharedInstance;

@end
