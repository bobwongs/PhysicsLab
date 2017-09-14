//
//  UIApplication+BWAdd.h
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/14.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BMAPNSTOKEN @"BMAPNSTOKEN"

@interface UIApplication (BWAdd)

//是否开启通知
+ (void)bm_isOpenMessageNotificationServiceWithBlock:(void(^)(BOOL isOpen))returnBlock;

/**
	应用版本
	@returns app版本  e.g  @"1.0.0"
 */
+ (NSString *)bm_appVersion;

/**
	build版本
	@returns build版本
 */
+ (NSString *)bm_appBuildVersion;

/**
	应用id
	@returns 应用id
 */
+ (NSString *)bm_appIdentifier;
//
///*
// 获取推送的Token
// @return 返回推送Token
// */
//+ (NSString *)bm_APNSToken;

//-----------------------------------
//---------------app相关--------------
//-----------------------------------

// 是否有相机权限
+ (BOOL)bm_haveCameraPower;

// 是否有相册权限
+ (BOOL)bm_haveAlbumPower;

/**
 *  应用程序在线更新
 *
 *  @param urlString  urlString appurl
 *  @param mustUpdate 是否强制更新
 *
 *  企业版更新
 *
 */
+ (void)bm_upDateApppWithURLString:(NSString *)urlString mustUpdate:(BOOL)mustUpdate;

/**
 *  拨打电话
 *
 *  @param phoneNumber 电话号码
 */
+ (void)bm_dialTelephoneWithPhoneNumber:(NSString *)phoneNumber;

/**
 *  获取当前正显示的控制器
 */
+ (UIViewController *)bm_topViewController;

@end
