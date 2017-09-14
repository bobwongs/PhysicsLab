//
//  BMTipsContentViewController.m
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/2.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BMTipsViewController.h"
#import "BMTipsContentView.h"

@interface BMTipsViewController ()

@property (strong, nonatomic) BMTipsContentView *tipsView;

@end

@implementation BMTipsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bmResult_setUI];
    
    if (self.iconImage) self.tipsView.iconImage = self.iconImage;
    if (self.tipsText) self.tipsView.tipsText = self.tipsText;
    self.tipsView.hideFirstButton = YES;  // 隐藏按钮
    [self.tipsView firstButtonAddTarget:self action:@selector(bmTips_firstButtonAction)];
}

#pragma mark - Action

- (void)bmTips_firstButtonAction {
    
}

#pragma mark - Private Method

- (void)bmResult_setUI {
    self.tipsView = [BMTipsContentView instanceView];
    [self.view addSubview:self.tipsView];
    [self.tipsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark - Setter and Getter

- (void)setIconImage:(UIImage *)iconImage {
    _iconImage = iconImage;
    self.tipsView.iconImage = iconImage;
}

- (void)setTipsText:(NSString *)tipsText {
    _tipsText = tipsText;
    self.tipsView.tipsText = tipsText;
}

- (void)setFirstButtonText:(NSString *)firstButtonText {
    _firstButtonText = firstButtonText;
    self.tipsView.firstButtonText = firstButtonText;
}

- (void)setHideFirstButton:(BOOL)hideFirstButton {
    _hideFirstButton = hideFirstButton;
    self.tipsView.hideFirstButton = hideFirstButton;
}

@end
