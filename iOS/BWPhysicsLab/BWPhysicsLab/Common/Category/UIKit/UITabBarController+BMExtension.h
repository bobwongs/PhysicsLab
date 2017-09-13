//
//  UITabBarController+BMExtension.h
//  B2BMall
//
//  Created by elvin on 2017/9/6.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (BMExtension)

//跳转到指定的页签首页
+ (void)tabBarWithSelectedIndex:(NSInteger)selectedIndex;

@end
