//
//  BMNoDataView.m
//  BMPurchaseSystem
//
//  Created by BobWong on 2016/12/6.
//  Copyright © 2016年 蓝月亮. All rights reserved.
//

#import "BMNoDataView.h"
#import "UIButton+BMExtension.h"

@interface BMNoDataView ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconImageViewTopConstraint;

@end

@implementation BMNoDataView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.iconImageViewTopConstraint.constant = SCREEN_HEIGHT * 0.15;
    self.titleLabel.textColor = BMb2b_text_color2;
    self.titleLabel.font = BMb2b_t3;
    [self.eventButton bmB2B_setButtonWithType:BMb2bButtonType_btn1_1];
}

+ (instancetype)emptyDataView {
    BMNoDataView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    view.autoresizingMask = UIViewAutoresizingNone;
    return view;
}

+ (instancetype)emptyDataViewWithTapActionBlock:(dispatch_block_t)tapActionBlock {
    return [self emptyDataViewWithIconImagedName:nil title:nil buttonTitle:nil tapActionBlock:tapActionBlock];
}

+ (instancetype)emptyDataViewWithIconImagedName:(NSString *)iconImagedName
                                          title:(NSString *)title
                                    buttonTitle:(NSString *)buttonTitle
                                 tapActionBlock:(dispatch_block_t)tapActionBlock {
    
    BMNoDataView *view = [self emptyDataView];
    if (iconImagedName) {
        view.iconImageView.image = [UIImage imageNamed:iconImagedName];
    }
    if (title) {
        view.titleLabel.text = title;
    }
    if (buttonTitle) {
        [view.eventButton setTitle:buttonTitle forState:UIControlStateNormal];
    }
    view.tapActionBlock = tapActionBlock;
    return view;
}

- (IBAction)buttonClick {
    if (self.tapActionBlock) self.tapActionBlock();
}

@end
