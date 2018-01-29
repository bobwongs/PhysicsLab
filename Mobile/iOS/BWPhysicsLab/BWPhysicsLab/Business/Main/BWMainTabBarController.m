//
//  BWMainTabBarController.m
//  BWPhysicsLab
//
//  Created by BobWong on 2017/12/28.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWMainTabBarController.h"
#import "BWHomeViewController.h"
#import "BWPhysicsViewController.h"
#import "BWLabViewController.h"
#import "BWMeViewController.h"

@interface BWMainTabBarController ()

@end

@implementation BWMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewController];
}

- (void)setupViewController {
    BWHomeViewController *homeVC = [BWHomeViewController new];
    UINavigationController *homeNavigationVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    BWPhysicsViewController *physicsVC = [BWPhysicsViewController new];
    UINavigationController *physicsNavigationVC = [[UINavigationController alloc] initWithRootViewController:physicsVC];
    
    BWLabViewController *labVC = [BWLabViewController new];
    UINavigationController *labNavigationVC = [[UINavigationController alloc] initWithRootViewController:labVC];
    
    BWMeViewController *meVC = [BWMeViewController new];
    UINavigationController *meNavigationVC = [[UINavigationController alloc] initWithRootViewController:meVC];
    
    self.viewControllers = @[homeNavigationVC, physicsNavigationVC, labNavigationVC, meNavigationVC];
    
    // Set title and image
    NSArray<NSString *> *titleArray = @[@"Home", @"Physics", @"Lab", @"Me"];
//    NSArray<NSString *> *normalImageNameArray = @[@"", @"", @"", @""];
//    NSArray<NSString *> *selectedImageNameArray = @[@"", @"", @"", @""];
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull vc, NSUInteger idx, BOOL * _Nonnull stop) {
        vc.tabBarItem.title = titleArray[idx];
//        vc.tabBarItem.image = [UIImage imageNamed:normalImageNameArray[idx]];
//        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageNameArray[idx]];
    }];
}

@end
