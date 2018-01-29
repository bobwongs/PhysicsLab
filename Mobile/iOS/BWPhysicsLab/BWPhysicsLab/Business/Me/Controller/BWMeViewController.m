//
//  BWMeViewController.m
//  BWPhysicsLab
//
//  Created by BobWong on 2017/12/28.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWMeViewController.h"

@interface BWMeViewController ()

@end

@implementation BWMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Me";
    
    [self setNavigationBar];
}

- (void)setNavigationBar {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)logout {
    NSLog(@"logout");
}

@end
