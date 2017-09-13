//
//  BMTipsViewController.h
//  B2BMall
//
//  Created by BobWong on 2017/9/2.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMSuperViewController.h"

@interface BMTipsViewController : BMSuperViewController

@property (strong, nonatomic) UIImage *iconImage;
@property (strong, nonatomic) NSString *tipsText;
@property (strong, nonatomic) NSString *firstButtonText;   // 默认隐藏
@property (assign, nonatomic) BOOL hideFirstButton;  ///< 默认隐藏

- (void)bmTips_firstButtonAction;

@end
