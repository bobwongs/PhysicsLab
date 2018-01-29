//
//  BWHomeViewController.m
//  BWPhysicsLab
//
//  Created by BobWong on 2017/12/28.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWHomeViewController.h"

@interface BWHomeViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation BWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    
    [self setNavigationBar];
}

- (void)setNavigationBar {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Login" style:UIBarButtonItemStylePlain target:self action:@selector(login)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)login {
    NSLog(@"Login");
}

@end
