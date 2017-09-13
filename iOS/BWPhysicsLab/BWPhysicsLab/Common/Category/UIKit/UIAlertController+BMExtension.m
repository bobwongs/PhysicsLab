//
//  UIAlertController+BMExtension.m
//  B2BMall
//
//  Created by BobWong on 2017/8/22.
//  Copyright © 2017年 BobWong. All rights reserved.
//

#import "UIAlertController+BMExtension.h"

@implementation UIAlertController (BMExtension)

+ (instancetype)bmB2B_alertControllerDefaultStyleWithMessage:(nullable NSString *)message confirmHandler:(BMUIAlertControllerHandler)confirmHandler cancelHandler:(BMUIAlertControllerHandler)cancelHandler {
    return [self bmB2B_alertControllerDefaultStyleWithTitle:@"提示" message:message confirmTitle:@"确定" confirmHandler:confirmHandler cancelTitle:@"取消" cancelHandler:cancelHandler];
}

+ (instancetype)bmB2B_alertControllerDefaultStyleWithTitle:(nullable NSString *)title message:(nullable NSString *)message confirmTitle:(nullable NSString *)confirmTitle confirmHandler:(BMUIAlertControllerHandler)confirmHandler cancelTitle:(nullable NSString *)cancelTitle cancelHandler:(BMUIAlertControllerHandler)cancelHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:confirmHandler]];
    if (cancelTitle) {
        [alertController addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:cancelHandler]];
    }
    return alertController;
}

@end
