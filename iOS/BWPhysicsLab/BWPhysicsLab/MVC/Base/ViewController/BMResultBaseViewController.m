//
//  BMResultBaseViewController.m
//  B2BMall
//
//  Created by BobWong on 2017/9/2.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMResultBaseViewController.h"
#import "UIButton+BMExtension.h"
#import <UIButton+BMKit.h>

@interface BMResultBaseViewController ()

@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;
@property (strong, nonatomic) UIButton *firstButton;
@property (strong, nonatomic) UIButton *secondButton;

@end

@implementation BMResultBaseViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bmResult_setUI];
    [self bmResult_setConstraints];
}

#pragma mark - Action

- (void)bmResult_FirstButtonAction:(id)sender {
}

- (void)bmResult_SecondButtonAction:(id)sender {
}

#pragma mark - Private Method

- (void)bmResult_setUI {
    self.iconImageView = [[UIImageView alloc] init];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.text = @" ";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = BMb2b_sub_color1;
    self.titleLabel.font = BMb2b_t1;
    
    self.descriptionLabel = [UILabel new];
    self.descriptionLabel.text = @" ";
    self.descriptionLabel.textAlignment = NSTextAlignmentCenter;
    self.descriptionLabel.textColor = BMb2b_text_color2;
    self.descriptionLabel.font = BMb2b_t3;
    
    self.firstButton = [UIButton bmB2B_buttonWithType:BMb2bButtonType_btn1_1];
    [self.firstButton addTarget:self action:@selector(bmResult_FirstButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.secondButton.titleLabel.font = BMb2b_t3;
    [self.secondButton setTitleColor:BMb2b_sub_color1 forState:UIControlStateNormal];
    [self.secondButton addTarget:self action:@selector(bmResult_SecondButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.iconImageView];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.descriptionLabel];
    [self.view addSubview:self.firstButton];
    [self.view addSubview:self.secondButton];
}

- (void)bmResult_setConstraints {
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(80);
        make.top.mas_equalTo(SCREEN_HEIGHT * 0.15);
        make.height.mas_equalTo(80);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.mas_equalTo(self.iconImageView.mas_bottom).offset(4);
    }];
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(4);
    }];
    [self.firstButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(70);
        make.right.mas_equalTo(-70);
        make.top.mas_equalTo(self.descriptionLabel.mas_bottom).offset(24);
        make.height.mas_equalTo(48);
    }];
    [self.secondButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.mas_equalTo(self.firstButton.mas_bottom).offset(12);
    }];
}

#pragma mark - Setter and Getter

- (void)setIconImage:(UIImage *)iconImage {
    _iconImage = iconImage;
    _iconImageView.image = iconImage;
}

- (void)setTitleText:(NSString *)titleText {
    _titleText = titleText;
    _titleLabel.text = titleText;
}

- (void)setDescriptionText:(NSString *)descriptionText {
    _descriptionText = descriptionText;
    _descriptionLabel.text = descriptionText;
}

- (void)setFirstButtonTitle:(NSString *)firstButtonTitle {
    _firstButtonTitle = firstButtonTitle;
    [_firstButton setTitle:firstButtonTitle forState:UIControlStateNormal];
}

- (void)setSecondButtonTitle:(NSString *)secondButtonTitle {
    _secondButtonTitle = secondButtonTitle;
    [_secondButton setTitle:secondButtonTitle forState:UIControlStateNormal];
    [_secondButton setUnderlineWithRang:NSMakeRange(0, _secondButton.titleLabel.text.length)];
}

- (void)setHideFirstButton:(BOOL)hideFirstButton {
    _hideFirstButton = hideFirstButton;
    _firstButton.hidden = hideFirstButton;
}

- (void)setHideSecondButton:(BOOL)hideSecondButton {
    _hideSecondButton = hideSecondButton;
    _secondButton.hidden = hideSecondButton;
}

@end
