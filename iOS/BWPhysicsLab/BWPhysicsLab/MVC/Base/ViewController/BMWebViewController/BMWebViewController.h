//
//  BMWebViewController.h
//  B2BMall
//
//  Created by BobWong on 2017/9/4.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMSuperViewController.h"

@interface BMWebViewController : BMSuperViewController

@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) UIImage *backButtonImage;  ///< 默认为白色返回

@end
