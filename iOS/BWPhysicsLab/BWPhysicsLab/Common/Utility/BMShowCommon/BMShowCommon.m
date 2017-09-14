//
//  BMShowCommon.m
//  BWPhysicsLab
//
//  Created by BobWong on 2016/10/17.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//


#import "BMShowCommon.h"
#import "BMAppContext.h"
#import <AVFoundation/AVFoundation.h>

#import <CXAlertView.h>
#import "WXApi.h"

#import "UIDevice+BWAdd.h"
#import "UIApplication+BWAdd.h"
//获取手机运营商
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
//版本比较
#import "BMVersionManager.h"
#import "BMAppContext.h"
//联系方式
#define BMContactTitle @"客服联系方式"
#define BMContactMessage @"1、拨打24小时客服电话 400-111-1118\n2、关注微信公众号“月亮小屋”进行在线咨询"
#define BMContactLeftButtonTitle @"前往微信咨询"
#define BMContactRightButtonTitle @"拨打客服电话"

//微信
#define BMWXTitle @"您还没有安装微信"
#define BMWXMessage @"是否前往App Store安装？"
#define BMWXLeftButtonTitle @"取消"
#define BMWXRightButtonTitle @"前往"

//SIM卡
#define BMSIMMessage @"未安装SIM卡"
#define BMSIMButtonTitle @"确定"

//照相机
#define BMCameraNoCameraMessage @"您的设备没有相机!"
#define BMCameraCameraPowerMessage @"应用程序没有相机权限,请去设置中打开!"

//版本更新
#define BMVersionUpdateTitle @"版本更新"
#define BMVersionUpdateLeftButtonTitle @"稍后再说"
#define BMVersionUpdateRightButtonTitle @"立即更新"



@implementation BMShowCommon

+ (void)showVideoAuthoritySettings
{
    
    NSString *title =@"还没有开启相机或麦克风权限~请在系统设置中开启";
    CXAlertView *alertView = [[CXAlertView alloc] initWithTitle:title message:nil cancelButtonTitle:nil];
    CGFloat sysVersion = [UIDevice currentDevice].systemVersion.floatValue;
    if (sysVersion < 8.0) {
        [alertView addButtonWithTitle:@"知道了" type:CXAlertViewButtonTypeDefault handler:^(CXAlertView *alertView, CXAlertButtonItem *button) {
            [alertView dismiss];
        }];
    }else{
        [alertView addButtonWithTitle:@"暂不" type:CXAlertViewButtonTypeDefault handler:^(CXAlertView *alertView, CXAlertButtonItem *button) {
            [alertView dismiss];
        }];
        [alertView addButtonWithTitle:@"去设置" type:CXAlertViewButtonTypeDefault handler:^(CXAlertView *alertView, CXAlertButtonItem *button) {
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }
            [alertView dismiss];
        }];
    }
    [alertView show];
}

+ (void)showContactInfo
{
    CXAlertView *alertView = [[CXAlertView alloc] initWithTitle:BMContactTitle message:BMContactMessage cancelButtonTitle:nil];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackgroud:)];
    [alertView addGestureRecognizer:tapGestureRecognizer];
    
    //alertView.showBlurBackground = NO;
    [alertView addButtonWithTitle:BMContactLeftButtonTitle type:CXAlertViewButtonTypeDefault handler:^(CXAlertView *alertView, CXAlertButtonItem *button) {
        if ([WXApi isWXAppInstalled]) {
            [alertView dismiss];
            [WXApi openWXApp];
        }else{
            [alertView dismiss];  // Modified by BobWong, 2017/1/18
            [self showUnInstallWX];
        }
    }];
    
    [alertView addButtonWithTitle:BMContactRightButtonTitle type:CXAlertViewButtonTypeDefault handler:^(CXAlertView *alertView, CXAlertButtonItem *button) {
        //获取手机运营商
        CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
        CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
        NSString *isoCountryCode = [carrier mobileCountryCode];
        if (isoCountryCode.length >0) {
            [alertView dismiss];
            //打电话
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://4001111118"]];
        }else{
            [alertView dismiss];  // Modified by BobWong, 2017/1/18
            [self showUnInstallSIM];
        }
    }];

    [alertView show];
}

+ (void)showUnInstallWX
{
    CXAlertView *wxAlertView = [[CXAlertView alloc] initWithTitle:BMWXTitle message:BMWXMessage cancelButtonTitle:nil];
    //wxAlertView.showBlurBackground = NO;
    [wxAlertView addButtonWithTitle:BMWXLeftButtonTitle type:CXAlertViewButtonTypeCancel handler:^(CXAlertView *alertView, CXAlertButtonItem *button) {
        [alertView dismiss];
    }];
    [wxAlertView addButtonWithTitle:BMWXRightButtonTitle type:CXAlertViewButtonTypeDefault handler:^(CXAlertView *alertView, CXAlertButtonItem *button) {
        [alertView dismiss];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[WXApi getWXAppInstallUrl]]];
    }];
    [wxAlertView show];
}

+ (void)showUnInstallSIM
{
//    CXAlertView *wxAlertView = [[CXAlertView alloc] initWithTitle:BMSIMMessage message:nil cancelButtonTitle:BMSIMButtonTitle];
//    [wxAlertView show];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:BMSIMMessage preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:BMSIMButtonTitle style:UIAlertActionStyleDefault handler:nil]];
    [[UIApplication bm_topViewController] presentViewController:alertController animated:YES completion:nil];
}


+ (void)tapBackgroud:(UITapGestureRecognizer *)recognizer
{
    CXAlertView *alertView = (CXAlertView *)recognizer.view;
    [alertView dismiss];
}

+ (BOOL)showCameraNotOK
{
    BOOL  isCameraOK = YES;
    NSString *mes = nil;
    NSString *title = @"提示";
    if (![UIDevice bm_hasCamera]){
        mes = BMCameraNoCameraMessage;
        isCameraOK = NO;
    }
    if (![UIApplication bm_haveCameraPower]){
        mes = BMCameraCameraPowerMessage;
        isCameraOK = NO;
    }
    
    if (!isCameraOK) {
        CXAlertView *wxAlertView = [[CXAlertView alloc] initWithTitle:title message:mes cancelButtonTitle:@"确定"];
        //wxAlertView.showBlurBackground = NO;
        [wxAlertView show];
    }
    return isCameraOK;
}

+ (void)showVersionUpdate
{
    NSString *clientVersion = [BMAppContext sharedInstance].clientVersion;
    NSString *latestVersion = [BMVersionManager sharedInstance].latestVersion;
    if (!latestVersion || latestVersion.length == 0 || [clientVersion compare:latestVersion options:NSNumericSearch] != NSOrderedAscending) {
        CXAlertView *alertView = [[CXAlertView alloc] initWithTitle:@"已经是最新版本" message:nil cancelButtonTitle:nil];
        [alertView addButtonWithTitle:@"确定" type:CXAlertViewButtonTypeDefault handler:^(CXAlertView *alertView, CXAlertButtonItem *button) {
            [alertView dismiss];
        }];
        [alertView show];
    }else{
        CXAlertView *alertView = [[CXAlertView alloc] initWithTitle:BMVersionUpdateTitle message:[BMVersionManager sharedInstance].updateDescription cancelButtonTitle:nil];
        if (![BMVersionManager sharedInstance].isForceUpdate) {
            [alertView addButtonWithTitle:BMVersionUpdateLeftButtonTitle type:CXAlertViewButtonTypeCancel handler:^(CXAlertView *alertView, CXAlertButtonItem *button) {
                [alertView dismiss];
            }];
        }
        
        [alertView addButtonWithTitle:BMVersionUpdateRightButtonTitle type:CXAlertViewButtonTypeDefault handler:^(CXAlertView *alertView, CXAlertButtonItem *button) {
            [alertView dismiss];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[BMVersionManager sharedInstance].downUrl]];
        }];
        [alertView show];
    }

}




@end
