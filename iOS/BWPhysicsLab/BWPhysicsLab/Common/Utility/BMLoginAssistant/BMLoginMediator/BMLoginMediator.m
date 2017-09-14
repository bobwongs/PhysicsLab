//
//  BMLoginMediator.m
//  BlueMoonBlueHouse
//
//  Created by BobWong on 15/9/28.
//  Copyright (c) 2015年 BobWong. All rights reserved.
//

#import "BMLoginMediator.h"
#import <SVProgressHUD.h>
#import "UIApplication+BWAdd.h"
//#import "BMLoginViewController.h"
#import "BMLoginUserManager.h"
#import "BMShowCommon.h"
#import <CXAlertView.h>
//#import "BMLogoutAPIManager.h"
//#import "BMLoginUserManager.h"
//#import "BMLoginRemindViewController.h"
#import "UINavigationController+BMExtension.h"
//#import "BMLoginExceptionViewController.h"
#import "BWMainTabBarController.h"

//登录
#define BMTokenInvalidTitle @"登录已过期,请重新登录"
#define BMTokenInvalidLeftButtonTitle @"暂不登录"
#define BMTokenInvalidRightButtonTitle @"去登录"

NSString *BMNotificationRequestLogin = @"NotificationRequestLogin";
NSString *BMNotificationLoginOK = @"NotificationLoginOK";
NSString *BMNotificationRegisterOK = @"NotificationRegisterOK";

NSString * BMNotificationNetworkingTokenInvalid = @"BMNotificationNetworkingTokenInvalid";
NSString * BMNotificationNetworkingUserUnLogin = @"BMNotificationNetworkingUserUnLogin";


@interface BMLoginMediator ()

@property (strong, nonatomic) UINavigationController *loginExceptionNavigationController;  // 重新登录VC
@property (nonatomic ,assign) BOOL tokenInvalidAlertViewShowing;//是否正在登录
//@property (retain, nonatomic) BMBaseAPIManager *manager;

@end

@implementation BMLoginMediator

#pragma mark - 生命周期
+ (instancetype)registerLoginMediator {
    static dispatch_once_t onceToken;
    static BMLoginMediator *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BMLoginMediator alloc] init];
        
        //这两个通知是有接口发出
        [[NSNotificationCenter defaultCenter] addObserver:sharedInstance selector:@selector(tokenInvalid:) name:BMNotificationNetworkingTokenInvalid object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:sharedInstance selector:@selector(userUnLogin:) name:BMNotificationNetworkingUserUnLogin object:nil];
        //请求登录
//        [[NSNotificationCenter defaultCenter] addObserver:sharedInstance selector:@selector(requestLoginNotification:) name:BMNotificationRequestLogin object:nil];  // 暂不用
        [[NSNotificationCenter defaultCenter] addObserver:sharedInstance selector:@selector(loginSuccessfully:) name:BMNotificationLoginOK object:nil];
    });
    return sharedInstance;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Public Method

- (void)changeToLoginStatus {
    [UIApplication sharedApplication].keyWindow.rootViewController = self.loginNavigationController;
    [[BMLoginUserManager sharedInstance] clean];  // 清楚登录信息
//    [BMLoginUserManager sharedInstance].loginedUserModel.loginStatus = BMUserLoginStatusUnLogin;  // 切换为登录失效
    [[NSNotificationCenter defaultCenter] postNotificationName:BMNotificationRequestLogin object:nil];  // 切换为登录状态的通知
}

#pragma mark - Private Method

- (void)userUnLogin:(NSNotification *)notification
{
//    if ([BMLoginUserManager sharedInstance].loginedUserModel.loginStatus != BMUserLoginStatusUnLogin) {
//        [BMLoginUserManager sharedInstance].loginedUserModel.loginStatus = BMUserLoginStatusUnLogin;
//    }
}
- (void)tokenInvalid:(NSNotification *)notification
{
//    if ([BMLoginUserManager sharedInstance].loginedUserModel.loginStatus != BMUserLoginStatusTokenInvalid) {
//        [BMLoginUserManager sharedInstance].loginedUserModel.loginStatus = BMUserLoginStatusTokenInvalid;
//    }
    [self showPreAlertLogin];
}

- (void)loginSuccessfully:(NSNotification *)notification {
    [UIApplication sharedApplication].keyWindow.rootViewController = [BWMainTabBarController new];
}

- (BOOL)isLogining
{
    UIViewController *topViewController = [UIApplication bm_topViewController];
    if (self.loginNavigationController == topViewController) {
        return YES;
    }else if ( self.loginExceptionNavigationController == topViewController){
        return YES;
    }
    return NO;
}

- (void)showPreAlertLogin {
    [UIApplication sharedApplication].keyWindow.rootViewController = self.loginExceptionNavigationController;
}

//显示登录UI
- (void)showLogin
{
    BOOL directShowLogin = NO;
//    if ( [BMLoginUserManager sharedInstance].loginedUserModel.loginStatus == BMUserLoginStatusTokenInvalid) {
//        directShowLogin = YES;
//    }
    
    //直接跳到登录页面，
//    BMLoginRemindViewController *loginRemindViewController = [[BMLoginRemindViewController alloc] init];
//    loginRemindViewController.directShowLogin = directShowLogin;
    
    [UIApplication sharedApplication].keyWindow.rootViewController = self.loginNavigationController;
}

#pragma mark - getters and setters

//- (UINavigationController *)loginNavigationController {
//    if (!_loginNavigationController) {
//        BMLoginViewController *loginVC = [BMLoginViewController new];
//        _loginNavigationController = [UINavigationController bm_rootViewController:loginVC tintColor:nil barTintColor:[UIColor whiteColor] titleColor:BMb2b_sub_color1 titleFont:[UIFont systemFontOfSize:16.0] barBgImageColor:[UIColor whiteColor] bottomLineColor:nil bottomLineHeight:0];
//    }
//    return _loginNavigationController;
//}
//
//- (UINavigationController *)loginExceptionNavigationController {
//    if (!_loginExceptionNavigationController) {
//        _loginExceptionNavigationController = [UINavigationController bmB2B_defaultStyleWithRootViewController:[BMLoginExceptionViewController new]];
//    }
//    return _loginExceptionNavigationController;
//}

@end
