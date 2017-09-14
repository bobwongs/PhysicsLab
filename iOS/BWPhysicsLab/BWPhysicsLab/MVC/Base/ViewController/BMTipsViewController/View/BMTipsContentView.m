//
//  BMTipsContentView.m
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/2.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BMTipsContentView.h"
#import "UIButton+BMExtension.h"

@interface BMTipsContentView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconImageViewTopConstraint;

@end

@implementation BMTipsContentView

#pragma mark - Life Cycle

+ (instancetype)instanceView {
    NSArray *arr = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    return [arr firstObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconImageViewTopConstraint.constant = SCREEN_HEIGHT * 0.15;
    self.tipsLabel.textColor = BMb2b_text_color2;
    self.tipsLabel.font = BMb2b_t3;
    [self.firstButton bmB2B_setButtonWithType:BMb2bButtonType_btn1_1];
}

#pragma mark - Public Method

- (void)firstButtonAddTarget:(id)target action:(SEL)selector {
    [_firstButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Setter and Getter

- (void)setIconImage:(UIImage *)iconImage {
    _iconImage = iconImage;
    _iconImageView.image = iconImage;
}

- (void)setTipsText:(NSString *)tipsText {
    _tipsText = tipsText;
    _tipsLabel.text = tipsText;
}

- (void)setFirstButtonText:(NSString *)firstButtonText {
    _firstButtonText = firstButtonText;
    [_firstButton setTitle:firstButtonText forState:UIControlStateNormal];
}

- (void)setHideFirstButton:(BOOL)hideFirstButton {
    _hideFirstButton = hideFirstButton;
    _firstButton.hidden = hideFirstButton;
}

@end
