//
//  BWBaseViewController.m
//  BWOnlineEducationiOS
//
//  Created by BobWong on 2017/6/6.
//  Copyright © 2017年 Bob Wong Studio. All rights reserved.
//

#import "BWBaseViewController.h"

@interface BWBaseViewController ()

@end

@implementation BWBaseViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)dealloc {
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

@end
