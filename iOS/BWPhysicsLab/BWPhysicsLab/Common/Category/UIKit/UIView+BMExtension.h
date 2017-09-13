//
//  UIView+BMExtension.h
//  B2BMall
//
//  Created by BobWong on 2017/8/21.
//  Copyright © 2017年 BobWong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BMExtension)

- (void)bm_setGradientBackgroundWithColorArray:(NSArray<UIColor *> *)colorArray;
- (void)bm_setGradientBackgroundWithColorArray:(NSArray<UIColor *> *)colorArray size:(CGSize)size;

@end
