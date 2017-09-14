//
//  BMAppContext.m
//  BlueMoonBlueHouse
//
//  Created by 冯立海 on 15/9/25.
//  Copyright (c) 2015年 fenglh. All rights reserved.
//

#import "BMAppContext.h"
#import <UIKit/UIKit.h>
#import "KeychainItemWrapper.h"
#import "SDImageCache.h"
#import "NSString+BMExtension.h"
//#import "NSUserDefaults+BMKit.h"
//#import "BMKitMacroDefinition.h"

#define keychainidentifier @"BMMoonHouse"
@interface BMAppContext ()

@property (nonatomic,strong,readwrite) NSString *clientVersion;//Version号
@property (nonatomic,strong,readwrite) NSString *clientBuild;//Build号
@property (nonatomic,strong,readwrite) NSString *appName;
@property (nonatomic,strong,readwrite) NSString *bundleIdendifier;
@property (nonatomic,strong,readwrite) NSString *uuidBM;
@property (nonatomic, assign, readwrite) NSUInteger appCacheSize;           //缓存大小
@property (nonatomic, strong, readwrite) NSString *appCacheSizeString;      //缓存大小
@property (strong, nonatomic) UIDevice *device;
@property (strong, nonatomic) KeychainItemWrapper *keychain;

@end

@implementation BMAppContext

#pragma mark - 声明周期

+ (instancetype)sharedInstance
{
    static BMAppContext *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BMAppContext alloc] init];
//        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    });
    return sharedInstance;
}

-(NSInteger)timeStampSecond
{
    return time(NULL);
}

#pragma mark -  getters and setters
- (KeychainItemWrapper *)keychain
{
    if (_keychain  == nil) {
        _keychain = [[KeychainItemWrapper alloc] initWithIdentifier:keychainidentifier accessGroup:nil];
    }
    return _keychain;
}

- (UIDevice *)device
{
    if (_device == nil) {
        _device = [UIDevice currentDevice];
    }
    return _device;
}

- (NSString *)clientVersion
{
    if (_clientVersion == nil) {
        _clientVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    }
    return _clientVersion;
}

- (NSString *)clientBuild
{
    
    if (_clientBuild == nil) {
        _clientBuild = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    }
    return _clientBuild;
}

- (NSString *)bundleIdendifier
{
    if (_bundleIdendifier == nil) {
        _bundleIdendifier = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
    }
    return _bundleIdendifier;
}


- (NSString *)appName
{
    if (_appName == nil) {
        _appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    }
    return _appName;
}

- (NSString *)uuidBM
{
    if (_uuidBM == nil) {
        _uuidBM = [self uuidBMFromKeychain];
    }
    return _uuidBM;
}

//**这里只计算图片缓存，接口缓存无法计算，暂不做**//
- (NSUInteger)appCacheSize
{
    _appCacheSize =  [[SDImageCache sharedImageCache] getSize];
    return _appCacheSize;
}

- (NSString *)appCacheSizeString
{
    CGFloat sizeB = self.appCacheSize;
    CGFloat sizeKB = sizeB/1024.00;
    CGFloat sizeMB = sizeKB/1024.00;
    if (sizeMB > 1) {
        _appCacheSizeString = [NSString stringWithFormat:@"%.2fMB",sizeMB];
    }else if(sizeKB > 1){
        _appCacheSizeString = [NSString stringWithFormat:@"%.2fKB",sizeKB];
    }else{
        _appCacheSizeString = [NSString stringWithFormat:@"%.2fB",sizeB];
    }
    NSLog(@"SDImageCache缓存大小:%@",_appCacheSizeString);
    return _appCacheSizeString;
}

#pragma mark - 私有方法
-(NSString*)uuid {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}

- (NSString*)uuidBMFromKeychain{
    NSString* uuid = nil;
    KeychainItemWrapper *keyChain = [[KeychainItemWrapper alloc] initWithIdentifier:keychainidentifier accessGroup:nil];
    id keychaindata = [keyChain objectForKey:(__bridge id)kSecAttrAccount];
    NSString *str = (NSString *)keychaindata;
    if (str.length==0) {
        uuid = [self uuid];
        [self.keychain setObject:uuid forKey:(__bridge id)kSecAttrAccount];
        str=uuid;
    }
    return str;
}


@end
