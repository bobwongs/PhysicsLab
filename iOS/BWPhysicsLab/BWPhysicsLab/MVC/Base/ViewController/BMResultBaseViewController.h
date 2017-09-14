//
//  BMResultBaseViewController.h
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/2.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BMSuperViewController.h"

@interface BMResultBaseViewController : BMSuperViewController

@property (strong, nonatomic) UIImage *iconImage;
@property (strong, nonatomic) NSString *titleText;
@property (strong, nonatomic) NSString *descriptionText;
@property (strong, nonatomic) NSString *firstButtonTitle;
@property (strong, nonatomic) NSString *secondButtonTitle;

@property (assign, nonatomic) BOOL hideFirstButton;  ///< 默认不隐藏
@property (assign, nonatomic) BOOL hideSecondButton;  ///< 默认不隐藏

// 子类中做实现
- (void)bmResult_FirstButtonAction:(id)sender;
- (void)bmResult_SecondButtonAction:(id)sender;

@end
