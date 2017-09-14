//
//  BMBannerModel.h
//  BWPhysicsLab
//
//  Created by BobWong on 17/09/01.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMImageModel.h"

@interface BMBannerModel : NSObject

@property (strong, nonatomic) NSString *link;  ///< 跳转链接
@property (strong, nonatomic) NSString *picName;  ///< 轮播图名称
@property (strong, nonatomic) BMImageModel *displayPic;  ///< 图片URL

@end
