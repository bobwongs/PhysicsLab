//
//  UIImageView+BMExtension.h
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/5.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (BMExtension)

- (void)bm_setImageWithURL:(NSURL *)url;  ///< Set image URL with default place holder

/**
 加载网络图片,使用默认占位图（加bm_b2b是为了防止和BMKit中的方法冲突）

 @param imageURLString 图片url
 */
- (void)bm_b2b_setImageWithImageURLString:(NSString *)imageURLString;

/**
 加载网络图片,自定义占位图（加bm_b2b是为了防止和BMKit中的方法冲突）

 @param imageURLString 图片url
 @param placeholderImageString 占位图name
 */
- (void)bm_b2b_setImageWithImageURLString:(NSString *)imageURLString placeholderImageString:(NSString *)placeholderImageString;

@end
