//
//  BWMainTabBarController.m
//  BWOnlineEducationiOS
//
//  Created by BobWong on 2017/6/6.
//  Copyright © 2017年 Bob Wong Studio. All rights reserved.
//

#import "BWMainTabBarController.h"
#import "BWHomeViewController.h"
#import "BWCategoryViewController.h"
#import "BWMeViewController.h"

@interface BWMainTabBarController ()

@end

@implementation BWMainTabBarController

#pragma mark - Life Cycle

- (instancetype)init {
    if (self = [super init]) {
        UINavigationController *homeNvgtVC = [[self class] navigationControllerWithClass:[BWHomeViewController class] itemTitle:<#(NSString *)#> normalImageName:<#(NSString *)#> selectedImageName:<#(NSString *)#>];
        
        UINavigationController *categoryNvgtVC = [[self class] navigationControllerWithClass:[BWCategoryViewController class]];
        
        UINavigationController *meNvgtVC = [[self class] navigationControllerWithClass:[BWMeViewController class]];
        
        self.viewControllers = @[homeNvgtVC, categoryNvgtVC, meNvgtVC];
    }
    return self;
}

#pragma mark - Private Method

+ (UINavigationController *)navigationControllerWithClass:(Class)viewControllerClass itemTitle:(NSString *)itemTitle normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[viewControllerClass new]];
    navigationController.tabBarItem.title = itemTitle;
    navigationController.tabBarItem.image = [UIImage imageNamed:normalImageName];
    navigationController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    return navigationController;
}

@end
