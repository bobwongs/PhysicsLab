//
//  BMTipsContentView.h
//  B2BMall
//
//  Created by BobWong on 2017/9/2.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
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
