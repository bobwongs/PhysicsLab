//
//  BWLoginViewController.m
//  BWPhysicsLab
//
//  Created by BobWong on 2018/1/29.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import "BWLoginViewController.h"
#import "BWLoginApi.h"

@interface BWLoginViewController () <YTKRequestDelegate>

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation BWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)loginAction:(id)sender {
    NSDictionary *argument = @{@"account": self.accountTextField.text,
                               @"password": self.passwordTextField.text};
    [SVProgressHUD show];
    [BWLoginApi requestWithArgument:argument completionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        [SVProgressHUD dismiss];
        NSLog(@"response object: %@", request.responseObject);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        [SVProgressHUD dismiss];
        NSLog(@"failure error: %@", request.error);
    }];
}

- (IBAction)registerAction:(id)sender {
}

- (IBAction)forgetPasswordAction:(id)sender {
}

@end
