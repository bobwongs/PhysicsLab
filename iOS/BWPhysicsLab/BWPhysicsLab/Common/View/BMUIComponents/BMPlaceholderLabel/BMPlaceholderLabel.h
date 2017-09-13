//
//  BMPlaceholderLabel.h
//  BMBlueMoonAngel
//
//  Created by fenglh on 2017/6/21.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>



/**
 placeholder Label，当text = nil 或 text = @""时，显示placeholder
 */
@interface BMPlaceholderLabel : UILabel
@property (strong, nonatomic) UILabel *placeholderLabel;

@end
