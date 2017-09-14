//
//  BMLoginUserModel.h
//  BWPhysicsLab
//
//  Created by BobWong on 2016/10/21.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <BMBaseNetworkConfigureProtocol.h>

/*
 * 描述:登录用户Model
 * 该类设计原则：只和已登录的用户信息有关
 * 注意：新增的实例成员必须实现NSCoding协议
 */



@interface BMLoginUserModel : NSObject<NSCoding>

@property (nonatomic, strong)NSString *nickName;                        //昵称
@property (nonatomic, strong)NSString *userName;                        //账号
@property (nonatomic, strong)NSString *pwd;                             //密码
@property (nonatomic, strong)NSString *token;                           //令牌
@property (nonatomic, strong)NSString *headerImageUrl;                  //头像url
//@property (nonatomic, assign)BMUserLoginStatus loginStatus;             //登录状态
@property (nonatomic, assign) int64_t balance;                          //余额
@property (assign, nonatomic) NSInteger cartCount;                      ///< 购物车数量

@end
