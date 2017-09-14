//
//  BMTipsContentView.h
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/2.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XXNibBridge.h>

@interface BMTipsContentView : UIView <XXNibBridge>

@property (strong, nonatomic) UIImage *iconImage;
@property (strong, nonatomic) NSString *tipsText;
@property (strong, nonatomic) NSString *firstButtonText;

@property (assign, nonatomic) BOOL hideFirstButton;  ///< 默认不隐藏

+ (instancetype)instanceView;
- (void)firstButtonAddTarget:(id)target action:(SEL)selector;

@end
