//
//  BWMainTabBarController.m
//  BWPhysicsLab
//
//  Created by BobWong on 2017/8/17.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWMainTabBarController.h"
//#import "BMHomeViewController.h"  // 暂不需要致富模块
//#import "BMMallViewController.h"
//#import "BMCartViewController.h"
//#import "BMMeViewController.h"
#import "UINavigationController+BMExtension.h"
#import "BMLoginUserManager.h"

@interface BWMainTabBarController ()

@end

@implementation BWMainTabBarController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewController];
    [self setData];
    [self setUI];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Private Method

- (void)setupViewController {
//    BMHomeViewController *homeVC = [BMHomeViewController new];
//    homeVC.hidesBottomBarWhenPushed = NO;
//    UINavigationController *homeNvgtVC = [UINavigationController bmB2B_defaultStyleWithRootViewController:homeVC];
//    homeNvgtVC.tabBarItem.title = @"致富";
    
//    BMMallViewController *mallVC = [BMMallViewController new];
//    mallVC.hidesBottomBarWhenPushed = NO;
//    UINavigationController *mallNvgtVC = [UINavigationController bmB2B_defaultStyleWithRootViewController:mallVC];
//    
//    BMCartViewController *cartVC = [BMCartViewController new];
//    cartVC.hidesBottomBarWhenPushed = NO;
//    UINavigationController *cartNvgtVC = [UINavigationController bmB2B_defaultStyleWithRootViewController:cartVC];
//
//    BMMeViewController *meVC = [BMMeViewController new];
//    meVC.hidesBottomBarWhenPushed = NO;
//    UINavigationController *meNvgtVC = [UINavigationController bmB2B_defaultStyleWithRootViewController:meVC];
//    
//    self.viewControllers = @[mallNvgtVC, cartNvgtVC, meNvgtVC];
    
    // Set title and image
    NSArray<NSString *> *titleArray = @[@"商城", @"购物车", @"我的"];
    NSArray<NSString *> *normalImageNameArray = @[@"shop2", @"cart2", @"user2"];
    NSArray<NSString *> *selectedImageNameArray = @[@"shop1", @"cart1", @"user1"];
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull vc, NSUInteger idx, BOOL * _Nonnull stop) {
        vc.tabBarItem.title = titleArray[idx];
        vc.tabBarItem.image = [[self class] getOriginalImageWithName:normalImageNameArray[idx]];
        vc.tabBarItem.selectedImage = [[self class] getOriginalImageWithName:selectedImageNameArray[idx]];
    }];
}

- (void)setData {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshCartNumNotification:) name:BMNotificationCartNumChange object:nil];
}

- (void)setUI {
    self.tabBar.translucent = NO;
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.backgroundImage = [[self class] bm_imageWithColor:[UIColor whiteColor] size:CGSizeMake(1.0, 1.0)];
}

#pragma mark - Tool

+ (UIImage *)bm_imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)getOriginalImageWithName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

@end
