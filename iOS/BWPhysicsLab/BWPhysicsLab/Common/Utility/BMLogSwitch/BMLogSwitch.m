//
//  BMLogSwitch.m
//  BlueMoonHouse
//
//  Created by BobWong on 15/11/27.
//  Copyright (c) 2015年 bluemoon. All rights reserved.
//

#import "BMLogSwitch.h"
#import <YYCategories.h>
#import "BMAppContext.h"

#define LOG_SWITCH_FILE_NAME_AT_DUCOUMENT_DIR   @"logswitch.txt"

@interface BMLogSwitch ()
@property (assign, readwrite,nonatomic) BOOL canPrintDebugLog;    //是否可以打印调试日志

@end

@implementation BMLogSwitch

#pragma mark - 生命周期
+ (instancetype)sharedInstance
{
    static BMLogSwitch *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BMLogSwitch alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
#ifdef DEBUG
        _canPrintDebugLog = YES;
#else
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docDir = [paths objectAtIndex:0];
        NSString *filePath = [NSString stringWithFormat:@"%@/%@", docDir, LOG_SWITCH_FILE_NAME_AT_DUCOUMENT_DIR];
        NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSString *contentMD5 = [content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSString *bundleIdentifierMD5 = [[BMAppContext sharedInstance].bundleIdendifier md5String];
        if ([contentMD5 isEqualToString:bundleIdentifierMD5]) {
            _canPrintDebugLog = YES;
        }else{
            _canPrintDebugLog = NO;
        }
#endif
    }
    return self;
}


@end

