//
//  BMRouterManager.h
//  B2BMall
//
//  Created by BobWong on 2017/9/11.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMRouterManager : NSObject

+ (void)routeToWaitForPayViewControllerWithCurrentVC:(UIViewController *)currentVC;
+ (void)routeToCartRootVCInCurrentVC:(UIViewController *)currentVC;
+ (void)routeToFirstViewControllerClass:(Class)firstVCClass inCurrentVC:(UIViewController *)currentVC;

@end
