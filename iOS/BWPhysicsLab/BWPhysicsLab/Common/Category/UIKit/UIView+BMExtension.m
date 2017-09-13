//
//  UIView+BMExtension.m
//  B2BMall
//
//  Created by BobWong on 2017/8/21.
//  Copyright © 2017年 BobWong. All rights reserved.
//

#import "UIView+BMExtension.h"
#import "CAGradientLayer+BMExtension.h"

@implementation UIView (BMExtension)

- (void)bm_setGradientBackgroundWithColorArray:(NSArray<UIColor *> *)colorArray {
    CGSize size = self.frame.size;
    if (ABS(size.width - 0.0) < 1.0) size.width = 1.0;
    if (ABS(size.height - 0.0) < 1.0) size.height = 1.0;
    
    [self bm_setGradientBackgroundWithColorArray:colorArray size:size];
}

- (void)bm_setGradientBackgroundWithColorArray:(NSArray<UIColor *> *)colorArray size:(CGSize)size {
    for (CALayer *subLayer in self.layer.sublayers) {
        if ([subLayer isKindOfClass:[CAGradientLayer class]]) {
            [subLayer removeFromSuperlayer];
        }
    }
    CAGradientLayer *layer = [CAGradientLayer bm_gradientLayerWithColorArray:colorArray size:size];
    [self.layer insertSublayer:layer atIndex:0];
}

@end
