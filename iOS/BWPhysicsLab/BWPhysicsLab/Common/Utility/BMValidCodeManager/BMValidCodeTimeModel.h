//
//  BMValidCodeTimeModel.h
//  BWPhysicsLab
//
//  Created by BobWong on 2016/10/24.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 * 描述:验证时间model
 *
 */

@interface BMValidCodeTimeModel : NSObject<NSCoding>
@property (nonatomic, strong) NSDate *lastFetchValidCodeDate;//最后一次获取验证码时间
@property (nonatomic, assign) NSUInteger intervalSeconds;//获取验证码时间间隔

@end
