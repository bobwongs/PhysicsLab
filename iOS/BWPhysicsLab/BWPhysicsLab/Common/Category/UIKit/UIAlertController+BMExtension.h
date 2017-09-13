//
//  UIAlertController+BMExtension.h
//  B2BMall
//
//  Created by BobWong on 2017/8/22.
//  Copyright © 2017年 BobWong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ __nullable BMUIAlertControllerHandler)(UIAlertAction * action);

@interface UIAlertController (BMExtension)

+ (instancetype)bmB2B_alertControllerDefaultStyleWithMessage:(nullable NSString *)message confirmHandler:(BMUIAlertControllerHandler)confirmHandler cancelHandler:(BMUIAlertControllerHandler)cancelHandler;

+ (instancetype)bmB2B_alertControllerDefaultStyleWithTitle:(nullable NSString *)title message:(nullable NSString *)message confirmTitle:(nullable NSString *)confirmTitle confirmHandler:(BMUIAlertControllerHandler)confirmHandler cancelTitle:(nullable NSString *)cancelTitle cancelHandler:(BMUIAlertControllerHandler)cancelHandler;

@end

NS_ASSUME_NONNULL_END
