//
//  BWConstDefinition.h
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/13.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#ifndef BWConstDefinition_h
#define BWConstDefinition_h

/* -------- BMLoginUserManager类中使用的keypath -------- */

extern NSString *BMLoginUserNickNameKeyPath;
extern NSString *BMLoginUserUserNameKeyPath;
extern NSString *BMLoginUserPwdKeyPath;
extern NSString *BMLoginUserTokenKeyPath;
extern NSString *BMLoginUserLoginStatusKeyPath;
extern NSString *BMLoginUserHeaderImageUrlKeyPath;
extern NSString *BMLoginUserBalanceKeyPath;

/* --------------------- 通知相关 ---------------------- */

extern NSString *BMNotificationUserInfoChange;
extern NSString *BMNotificationOrderStatusChange;//单状态改变的通知
extern NSString *BMNotificationUserDetailInfoChange;//门店信息修改

/* --------------------- 登录中间者 --------------------- */

extern NSString *BMNotificationRequestLogin;
//extern NSString *BMNotificationLoginCancelOK;
extern NSString *BMNotificationLoginOK;
extern NSString *BMNotificationRegisterOK;

/* --------------------- 购物车 --------------------- */

extern NSString *BMNotificationCartNumChange;  // 刷新购物车数量


//商品状态
#define kBMItemStatus                    @"itemStatus"                        //商品状态
#define vBMItemStatusOn                  @"1"                                 //上架
#define vBMItemStatusOff                 @"0"                                 //下架

#endif /* BWConstDefinition_h */
