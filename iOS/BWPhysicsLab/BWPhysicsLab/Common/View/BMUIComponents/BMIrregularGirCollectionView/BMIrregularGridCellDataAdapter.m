//
//  BMIrregularGridCellDataAdapter.m
//  BMBlueMoonAngel
//
//  Created by fenglh on 2017/6/21.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMIrregularGridCellDataAdapter.h"

@implementation BMIrregularGridCellDataAdapter
+ (instancetype)collectionGridCellDataAdapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifier data:(id)data
                                                            cellType:(NSInteger)cellType itemWidth:(CGFloat)itemWidth selected:(BOOL)selected font:(UIFont *)font{
    
    BMIrregularGridCellDataAdapter *adapter = [[self class] new];
    adapter.cellReuseIdentifier           = cellReuseIdentifier;
    adapter.data                          = data;
    adapter.cellType                      = cellType;
    adapter.itemWidth                     = itemWidth;
    adapter.selected                      = selected;
    adapter.font                          = font;
    
    return adapter;
}

@end
