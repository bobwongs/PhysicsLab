//
//  BMImageModel.h
//  BMWash
//
//  Created by elvin on 2016/10/19.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 图片model
 */
@interface BMImageModel : NSObject

@property (assign, nonatomic) CGFloat height;//高度
@property (assign, nonatomic) CGFloat width;//宽度
@property (strong, nonatomic) NSString *picUrl;//图片链接地址

@end
