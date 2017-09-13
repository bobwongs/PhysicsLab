//
//  BMFieldBtn1View.h
//  BMBlueMoonAngel
//
//  Created by fenglh on 2017/6/16.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XXNibBridge.h>

@interface BMFieldBtn1View : UIView <XXNibBridge>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIView *verticalLine;

@end
