//
//  BMVersionManager.h
//  BlueMoonSFA
//
//  Created by BobWong on 2017/3/7.
//  Copyright © 2017年 BlueMoon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^failure)(NSInteger errorCode);
typedef void(^success)(BOOL isNeedUpdate, NSString *version, NSString *buildVersion,BOOL isForceUpdate, NSString *download, NSString *description);

@interface BMVersionManager : NSObject


//版本更新
@property (nonatomic,strong) NSString *latestVersion;                   //最新版本
@property (nonatomic,strong) NSString *updateDescription;               //更新描述
@property (nonatomic,strong) NSString *downUrl;                         //下载地址
@property (nonatomic,assign) BOOL isForceUpdate;                        //是否强制更新

+ (instancetype)sharedInstance;

//检查版本更新
- (void)checkVersionUpdate:(success)success failure:(failure)failure;
- (void)checkWebVersion:(void(^)(NSString *))version;

@end
