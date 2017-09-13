//
//  UITableViewCell+BMExtension.m
//  B2BMall
//
//  Created by ___liangdahong on 2017/9/1.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "UITableViewCell+BMExtension.h"

@implementation UITableViewCell (BMExtension)

+ (instancetype)bm_cellWithTableView:(UITableView *)tableView {
    NSString *selfClassName = NSStringFromClass(self.class);
    // 取cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selfClassName];
    // 如果取待了就直接返回了
    if (cell) {
        return cell;
    }
    // 查找是否有
    NSString *path = [[NSBundle mainBundle] pathForResource:selfClassName ofType:@"nib"];
    if (path.length) {
        // 如果有就加载xib
        cell = [[[UINib nibWithNibName:selfClassName bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
        // 强制设置重用标识
        [cell setValue:selfClassName forKey:@"reuseIdentifier"];
    } else {
        // 使用 alloc 创建 Cell
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:selfClassName];
    }
    return cell;
}

@end
