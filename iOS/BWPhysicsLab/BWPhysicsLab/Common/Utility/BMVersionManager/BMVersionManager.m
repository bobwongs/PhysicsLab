//
//  BMVersionManager.m
//  BlueMoonSFA
//
//  Created by fenglh on 2017/3/7.
//  Copyright © 2017年 BlueMoon. All rights reserved.
//

#import "BMVersionManager.h"
#import "BMAppContext.h"
#import "BMGetAppUpdateVersionAPIManager.h"
#import "NSString+BMKit.h"


@interface BMVersionManager ()<BMAPIManagerCallBackDelegate>

//检查更新成功和失败的回调
@property (nonatomic, strong) success checkUpdateSuccessCallback;
@property (nonatomic, strong) failure checkUpdateFailureCallback;

//检查版本更新
@property (assign, nonatomic) NSUInteger getLastVersionRequestId;
@property (strong, nonatomic) BMGetAppUpdateVersionAPIManager *getLastVersionAPIManager;

@end
@implementation BMVersionManager



+ (instancetype)sharedInstance
{
    static BMVersionManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BMVersionManager alloc] init];
    });
    return sharedInstance;
}


#pragma mark - 接口


- (BMGetAppUpdateVersionAPIManager *)getLastVersionAPIManager
{
    if (_getLastVersionAPIManager == nil) {
        _getLastVersionAPIManager = [[BMGetAppUpdateVersionAPIManager alloc] init];
        _getLastVersionAPIManager.apiCallBackDelegate = self;
    }
    return _getLastVersionAPIManager;
}


//版本更新检查
- (void)checkVersionUpdate:(success)success failure:(failure)failure
{
    self.checkUpdateSuccessCallback = success;
    self.checkUpdateFailureCallback = failure;
    self.getLastVersionRequestId = [self.getLastVersionAPIManager loadData];
}


#pragma mark - 自定义 delegate

- (void)managerCallApiDidSuccess:(BMBaseAPIManager *)manager
{
    id data = [manager fetchDataWithReformer:nil] ;
    if (self.getLastVersionRequestId == manager.requestId) {
        NSString *buildVersion = [[data objectForKey:@"latestVersion"] objectForKey:@"buildVersion"];
        NSString *version = [[data objectForKey:@"latestVersion"] objectForKey:@"version"];
        NSString *downloadLink = [[data objectForKey:@"latestVersion"] objectForKey:@"download"];
        NSString *description = [[data objectForKey:@"latestVersion"] objectForKey:@"description"];
        BOOL isForceUpdate = [[[data objectForKey:@"latestVersion"] objectForKey:@"mustUpdate"] boolValue];
        
        self.latestVersion = version;
        self.downUrl = downloadLink;
        self.isForceUpdate = isForceUpdate;
        self.updateDescription = description;
        
        BOOL isNeedUpdate = NO;
        if ([[BMAppContext sharedInstance].clientVersion bm_versionCompare:version] < 0) isNeedUpdate = YES;
        self.checkUpdateSuccessCallback?self.checkUpdateSuccessCallback(isNeedUpdate,version, buildVersion, isForceUpdate, downloadLink, description):nil;
        DDLogDebug(@"检查版本更新:\n\tAPP版本:%@(客户端版本:%@)\n\tbuildVersion:%@\n\tAPP下载链接:%@\n\t描述:%@\n\t是否更新:%@", version,[BMAppContext sharedInstance].clientVersion, buildVersion,downloadLink,description,isNeedUpdate?@"是":@"否");
    }
}


- (void)managerCallApiDidFailed:(BMBaseAPIManager *)manager
{
    if (self.getLastVersionRequestId == manager.requestId) {
        self.checkUpdateFailureCallback?self.checkUpdateFailureCallback(manager.errorCode):nil;
    }
}



@end
