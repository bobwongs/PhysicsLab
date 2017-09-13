//
//  BMTextArrowCell.h
//  BMBlueMoonAngel
//
//  Created by BobWong on 2017/6/13.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMTextArrowView.h"

@interface BMTextArrowCell : UITableViewCell

@property (copy, nonatomic) NSString *title;  ///< Title
@property (copy, nonatomic) NSString *content;  ///< Content
@property (assign, nonatomic) BOOL lineHidden;  ///< 是否隐藏底部线条，默认显示

@property (weak, nonatomic) IBOutlet BMTextArrowView *containerView;

@end
