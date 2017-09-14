//
//  UITabBarController+BMExtension.h
//  BWPhysicsLab
//
//  Created by elvin on 2017/9/6.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (BMExtension)

//跳转到指定的页签首页
+ (void)tabBarWithSelectedIndex:(NSInteger)selectedIndex;

@end
