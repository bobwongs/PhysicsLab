//
//  BMSingleLineRadioView.h
//  BMBlueMoonAngel
//
//  Created by BobWong on 2017/6/19.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XXNibBridge.h>
#import "BMRadioView.h"

@interface BMSingleLineRadioView : UIView <XXNibBridge>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet BMRadioView *radioView;
@property (weak, nonatomic) IBOutlet UIView *lineView;

@end
