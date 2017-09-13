//
//  BMLoginUserManager.h
//  BMWash
//
//  Created by fenglh on 2016/10/21.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMLoginUserModel.h"

/*
 * 描述:登录用户的用户信息管理类。
 * 设计模式：观察者模式
 *
 * 实现：1. 使用KVO，当调用更改用户信息的接口(更改用户名、token、手机号码、昵称、头像)都会被该类感知.
 *      2. 当该对象感知到用户信息被修改，会发出BMNotificationUserInfoChange广播通知
 *      3. 监听该通知的类可以使用NSString *changeKeyPath = notification.object;  if(changeKeyPath == BMLoginUserHeaderImageUrlKeyPath)来判断是否头像发生改变
 *      4. 整个App的用户信息，都从该对象中loginedUserModel 读取。禁止通过接口读取而跳过这一步.
 *
 
 * 2016/11/04 fenglh
 * version 1.0.0
 
 * 2016/11/16 fenglh
 * version 1.0.1
 * 修改：1.将宏定义换成常量并extern，通知object带上keypath，方便判断loginedUserModel的哪个成员发生改变
 *
 * 2016/12/05 fenglh
 * version 1.0.2
 * 修改：1.observeValueForKeyPath方法内，增加判断新旧值一致，防止循环发送通知
 */






@interface BMLoginUserManager : NSObject

@property (nonatomic, readonly,strong) BMLoginUserModel *loginedUserModel;//已登录用户model

+ (instancetype)sharedInstance;

//登出
- (void)logout;
//持久化，保存loginedUserModel 到本地
- (void)cacheToDisk;
- (void)clean;//清除数据，例如在登出的时候
/*
 * 异步更新用户数据。
 * 使用者可以监听BMNotificationUserInfoChange通知得到更新完毕的时机再去读取loginedUserModel来刷新界面
 */
- (void)asynUpdateUserInfo;

- (BOOL)checkLoginStatus;  // 判断登录态

@end

//BMLoginUserManager 类中使用的keypath
extern NSString *BMLoginUserNickNameKeyPath;
extern NSString *BMLoginUserUserNameKeyPath;
extern NSString *BMLoginUserPwdKeyPath;
extern NSString *BMLoginUserTokenKeyPath;
extern NSString *BMLoginUserLoginStatusKeyPath;
extern NSString *BMLoginUserHeaderImageUrlKeyPath;
extern NSString *BMLoginUserBalanceKeyPath;
extern NSString *BMLoginUserCartCount;
//用户信息改变通知
extern NSString *BMNotificationUserInfoChange;
extern NSString *BMNotificationRquestCenterPopToViewController;

