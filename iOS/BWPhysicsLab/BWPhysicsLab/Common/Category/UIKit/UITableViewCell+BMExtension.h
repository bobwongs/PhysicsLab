//
//  UITableViewCell+BMExtension.h
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/1.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UITableViewCell BMReusable
 */
@interface UITableViewCell (BMExtension)

/**
 创建Cell外部不需要任何注册操作（内部会看是否有此Xib有就加载xib，没有就 alloc 创建）
 
 @param tableView tableView
 @return 创建的Cell
 */
+ (instancetype)bm_cellWithTableView:(UITableView *)tableView;

@end
