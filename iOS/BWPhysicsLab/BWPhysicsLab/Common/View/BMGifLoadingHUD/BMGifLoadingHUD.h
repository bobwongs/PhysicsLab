//
//  BMGifLoadingHUD.h
//  BWPhysicsLab
//
//  Created by BobWong on 2017/8/30.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FLAnimatedImage;

@interface BMGifLoadingHUD : UIView

+ (void)show;  ///< 默认不响应用户点击，有一些恶心的情况待兼容
+ (void)showWithoutInteraction;  ///< 不响应用户点击
+ (void)showWithInteraction;  ///< 响应用户点击
+ (void)dismiss;
+ (void)dismissWithoutAnimation;  ///< 隐藏不伴随动画

+ (void)setGifImage:(FLAnimatedImage *)gifImage;

@end

/*
 待优化
     BMGifLoadingHUD  使用了 dismiss    如果马上（0.25秒内）又 使用  show 会无效
 */
