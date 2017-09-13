//
//  UIImageView+BMExtension.m
//  B2BMall
//
//  Created by BobWong on 2017/9/5.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "UIImageView+BMExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (BMExtension)

- (void)bm_setImageWithURL:(NSURL *)url {
    [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"bm_place_holder_normal"]];
}

- (void)bm_b2b_setImageWithImageURLString:(NSString *)imageURLString {
    [self bm_b2b_setImageWithImageURLString:imageURLString placeholderImageString:@"bm_place_holder_normal"];
}

- (void)bm_b2b_setImageWithImageURLString:(NSString *)imageURLString placeholderImageString:(NSString *)placeholderImageString {
    [self sd_setImageWithURL:[NSURL URLWithString:imageURLString] placeholderImage:[UIImage imageNamed:placeholderImageString] options:SDWebImageRetryFailed | SDWebImageLowPriority];
}

@end
