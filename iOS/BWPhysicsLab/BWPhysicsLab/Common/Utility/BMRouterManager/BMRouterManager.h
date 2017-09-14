//
//  BMRouterManager.h
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/11.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMRouterManager : NSObject

+ (void)routeToFirstViewControllerClass:(Class)firstVCClass inCurrentVC:(UIViewController *)currentVC;

@end
