//
//  BMFieldBtn2View.h
//  B2BMall
//
//  Created by BobWong on 2017/9/1.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XXNibBridge.h>

@interface BMFieldBtn2View : UIView <XXNibBridge>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIView *lineView;

@property (strong, nonatomic) NSString *placeholderString;  ///< 提示语

@end
