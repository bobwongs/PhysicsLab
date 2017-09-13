//
//  BMSetNumberAlert.h
//  B2BMall
//
//  Created by BobWong on 2017/9/5.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BMSetNumberAlertConfirmBlock)(NSInteger count);

@interface BMSetNumberAlert : NSObject

- (void)showWithCount:(NSInteger)count;

@property (copy, nonatomic) BMSetNumberAlertConfirmBlock confirmBlock;
@property (copy, nonatomic) dispatch_block_t dismissBlock;

@end
