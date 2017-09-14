//
//  BMRouterManager.m
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/11.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BMRouterManager.h"
#import <UIKit/UIKit.h>
#import "BMOrderListViewController.h"
#import "BMCartViewController.h"

@implementation BMRouterManager

+ (void)routeToWaitForPayViewControllerWithCurrentVC:(UIViewController *)currentVC {
    UINavigationController *navigationController = currentVC.navigationController;
    if (!navigationController) return;
    
    NSArray *arrayVC = navigationController.viewControllers;  // 获得VC数组
    BMOrderListViewController *orderListVC = [BMOrderListViewController new];
    orderListVC.orderTabStatus = BMOrderTabStatusWaitPayment;
    [navigationController pushViewController:orderListVC animated:YES];  // 跳转到订单列表
    
    navigationController.viewControllers = @[arrayVC.firstObject, orderListVC];  // 修改VC Stack
}

+ (void)routeToCartRootVCInCurrentVC:(UIViewController *)currentVC {
    [self routeToFirstViewControllerClass:[BMCartViewController class] inCurrentVC:currentVC];
}

+ (void)routeToFirstViewControllerClass:(Class)firstVCClass inCurrentVC:(UIViewController *)currentVC {
    UITabBarController *tabBarVC = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [tabBarVC.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull vc, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([vc isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navigationController = vc;
            if ([navigationController.viewControllers.firstObject isKindOfClass:firstVCClass]) {
                UINavigationController *navigationController = currentVC.navigationController;
                if (tabBarVC.selectedIndex != idx) {
                    tabBarVC.selectedIndex = idx;  // 不在同一个目标Tag，则做切换
                    [navigationController popToRootViewControllerAnimated:NO];
                } else {
                    [navigationController popToRootViewControllerAnimated:YES];  // 所在页面Pop to root
                }
                *stop = YES;
            }
        }
    }];
}

@end

/* 原来的跳转逻辑
 // 切换到“我的”
 UITabBarController *tabBarVC = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
 tabBarVC.selectedIndex = 4;
 // 再进去待支付
 //        BMOrderListManagerViewController *vcOrderList = [BMOrderListManagerViewController new];
 //        vcOrderList.orderStatus = BMOrderStatusWaitPayment;
 //        [tabBarVC.viewControllers.lastObject pushViewController:vcOrderList animated:NO];
 // 所在页面Pop to root
 [self.navigationController popToRootViewControllerAnimated:NO];
 */
