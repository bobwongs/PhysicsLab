//
//  BMLogSwitch.h
//  BlueMoonHouse
//
//  Created by fenglh on 15/11/27.
//  Copyright (c) 2015年 bluemoon. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  日志开关.在打release包得时候，默认情况下在控制台是没有日志输出的，但是当我们手动在document目录下加入指定文件，则可以开启日志输出功能。方便调试
 *  程序每次启动都会在Document目录下查找logswitch.txt文件，并取得文件的内容content，
 *  如果md5(content)的值与md5(bundleIdentifier)的值相等，那么则允许输出调试日志
 */
@interface BMLogSwitch : NSObject
@property (assign, readonly,nonatomic) BOOL canPrintDebugLog;    //是否可以打印调试日志
+ (instancetype)sharedInstance;

@end
