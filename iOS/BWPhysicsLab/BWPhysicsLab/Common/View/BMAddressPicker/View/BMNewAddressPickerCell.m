//
//  BMNewAddressPickerCell.m
//  BMiOSUIComponents
//
//  Created by BobWong on 2017/6/1.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BMNewAddressPickerCell.h"

@implementation BMNewAddressPickerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.textColor = BMb2b_sub_color1;
    self.iconImageView.image = [self.iconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.iconImageView.tintColor = BMb2b_sub_color1;
}

@end
