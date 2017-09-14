//
//  BMLoginMediator.h
//  BlueMoonBlueHouse
//
//  Created by BobWong on 15/9/28.
//  Copyright (c) 2015年 BobWong. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "BMBaseAPIManager.h"
/*
 * @brief 登录中间者类。（弱业务）
 * 设计模式：中间者模式
 
 * 目的：该类只负责对登录UI(BMLoginViewController)的展示和消失
 * 使用：1. 使用者只需要发出通知（请求登录、取消登录、登录成功、登出成功），告诉登录中间者即可。中间者将自行处理登录UI的展示和消失
        2. 整个App中，登录界面的展示和消失都只能通过该对象来管理，禁止自由发挥！
 *
 * 2016/11/04 BobWong
 * version 1.0.0
 
 * 2016/11/16 BobWong
 * version 1.0.1
 * 修改：将所有宏定义的通知改成NSString 变量，并使用extern提示
 * -------------------------------------------------------
 * 2016/12/05 BobWong
 * version 1.0.2
 * 修改：1.修改token过期处理逻辑，其中涉及类包括BMBaseAPIManager、BMLoginUserManager
 * 修改：2.移除“取消成功”的通知
 * -------------------------------------------------------
 * 2017/01/13 BobWong
 * version 1.0.3
 * 修改：将同步用户信息的调用，放到相对的接口。该类只做登录界面的生命周期管理(出现和消失)
 
 */

@interface BMLoginMediator : NSObject

@property (nonatomic ,strong) UINavigationController *loginNavigationController;  ///< 登录控制器

+ (instancetype)registerLoginMediator;
- (void)changeToLoginStatus;

@end

//通知
extern NSString *BMNotificationRequestLogin;  // 请求登录，切换到登录页
extern NSString *BMNotificationLoginOK;
extern NSString *BMNotificationRegisterOK;
