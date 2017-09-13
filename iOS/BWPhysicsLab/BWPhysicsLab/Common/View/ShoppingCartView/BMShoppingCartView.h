//
//  BMShoppingCartView.h
//  BMWash
//
//  Created by ___liangdahong on 2017/2/14.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 购物车view （包含了角标信息，默认为 白色购物车）
 */
@interface BMShoppingCartView : UIView

@property (assign, nonatomic) NSInteger angleCount; ///< 角标
@property (copy, nonatomic) NSString *imageName;    ///< 购物车 icon 名称
@property (copy, nonatomic) dispatch_block_t block; ///< 点击block
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightCons;

/**
 创建 购物车view

 @param angleCount 角标
 @param block 点击回调block
 */
+ (instancetype)shoppingCartViewWithAngleCount:(NSInteger)angleCount clickBlock:(dispatch_block_t)block;

@end
