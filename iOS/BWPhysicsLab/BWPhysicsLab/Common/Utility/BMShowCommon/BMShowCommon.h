//
//  BMShowContactInfo.h
//  BMWash
//
//  Created by fenglh on 2016/10/17.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * 公共正式弹窗提示类
 * 正式是指区别于SVProgressHUD、MBprogressHUD这些。
 * 显示客服联系方式、未安装SIM卡、未安装微信
 *
 * 添加原则：该类所有弹窗都使用：CXAlertView ,禁止使用SVProgressHUD、MBprogressHUD这种提示
 * 备注:pod search CXAlertView 查看git地址，并学习demo用法
 *
 */

@interface BMShowCommon : NSObject
+ (void)showContactInfo;//显示客服联系方式
+ (void)showVersionUpdate;//显示版本更新
+ (void)showUnInstallWX;//显示为安装微信

+ (void)showUnInstallSIM;//显示未安装SIM卡
+ (BOOL)showCameraNotOK;//照相机
+ (void)showVideoAuthoritySettings;//显示未开启相机或者麦克风权限
@end
