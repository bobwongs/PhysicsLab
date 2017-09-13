//
//  BMBannerModel.h
//  B2BMall
//
//  Created by BobWong on 17/09/01.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMImageModel.h"

@interface BMBannerModel : NSObject

@property (strong, nonatomic) NSString *link;  ///< 跳转链接
@property (strong, nonatomic) NSString *picName;  ///< 轮播图名称
@property (strong, nonatomic) BMImageModel *displayPic;  ///< 图片URL

@end
