//
//  UIApplication+BWAdd.m
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/14.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "UIApplication+BWAdd.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
//获取手机运营商
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

#import <UserNotifications/UserNotifications.h>

@implementation UIApplication (BWAdd)

+ (void)bm_isOpenMessageNotificationServiceWithBlock:(void(^)(BOOL isOpen))returnBlock
{
    BOOL isOpen = NO;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    if (setting.types != UIUserNotificationTypeNone) {
        isOpen = YES;
    }
    
#elif __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
    [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings *settings) {
        if (returnBlock) {
            returnBlock(settings.authorizationStatus == UNAuthorizationStatusAuthorized);
        }
    }];
    
#else
    UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    if (type != UIRemoteNotificationTypeNone) {
        isOpen = YES;
    }
#endif
    if (returnBlock) {
        returnBlock(isOpen);
    }
}

+ (NSString *)bm_appVersion
{
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    return [dic objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)bm_appBuildVersion
{
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    return [dic objectForKey:@"CFBundleVersion"];
}

// 获取 Bundle identifier
+ (NSString *)bm_appIdentifier
{
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    return [dic objectForKey:@"CFBundleIdentifier"];
}

//+ (NSString *)bm_APNSToken
//{
//    return [NSUserDefaults bm_getObjectFromNSUserDefaultsWithKey:BMAPNSTOKEN];
//}

// 是否有相机权限
+ (BOOL)bm_haveCameraPower
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) return NO;
    return YES;
}

// 是否有相册权限
+ (BOOL)bm_haveAlbumPower
{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author == ALAuthorizationStatusDenied) return NO;
    return YES;
}

+ (void)bm_upDateApppWithURLString:(NSString *)urlString mustUpdate:(BOOL)mustUpdate
{
    if (!urlString){
        return;
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    if (mustUpdate){
        // 强制更新
        exit(0);
    }
}

/**
 // 1.拨打完电话回不到原来的应用，会停留在通讯录里，而且是直接拨打，不弹出提示
 //    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phoneNumber];
 //    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
 
 //2.拨打完毕会回到应用程序 有弹窗
 //    NSMutableString *str =[[NSMutableString alloc] initWithFormat:@"tel:%@",phoneNumber];
 //    UIWebView * callWebview = [[UIWebView alloc] init];
 //    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
 //    [[UIApplication sharedApplication].keyWindow addSubview:callWebview];
 */
+ (void)bm_dialTelephoneWithPhoneNumber:(NSString *)phoneNumber {
    
    if (!phoneNumber) {
        return;
    }
    //获取手机运营商
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    NSString *isoCountryCode = [carrier mobileCountryCode];
    if (isoCountryCode.length >0) {
        //打电话
        NSMutableString * str = [[NSMutableString alloc] initWithFormat:@"telprompt://%@",phoneNumber];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }else{
#warning 待自封装HUD
//        [BMShowHUD showInfoToView:[[UIApplication bm_topViewController] view] withText:@"未安装SIM卡"];
    }
}


/**
 *  获取当前正显示的控制器
 */
+ (UIViewController *)bm_topViewController {
    
    UIViewController *rootViewController = ((UIWindow *)[[[UIApplication sharedApplication] windows] objectAtIndex:0]).rootViewController;
    UIViewController *topViewController = rootViewController;
    while (topViewController.presentedViewController) {
        topViewController = topViewController.presentedViewController;
    }
    return topViewController;
}

@end
