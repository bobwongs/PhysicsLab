//
//  UITabBarController+BMExtension.m
//  B2BMall
//
//  Created by elvin on 2017/9/6.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "UITabBarController+BMExtension.h"

@implementation UITabBarController (BMExtension)

//跳转到指定的页签首页
+ (void)tabBarWithSelectedIndex:(NSInteger)selectedIndex{
    UITabBarController *tabBarController = (UITabBarController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    UINavigationController *navigationController =  (UINavigationController *)tabBarController.selectedViewController;
    [navigationController popToRootViewControllerAnimated:NO];
    tabBarController.selectedIndex = selectedIndex;
}

@end
