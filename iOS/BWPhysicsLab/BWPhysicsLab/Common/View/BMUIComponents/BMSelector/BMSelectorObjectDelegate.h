//
//  BMSelectorObjectDelegate.h
//  BMBlueMoonAngel
//
//  Created by fenglh on 2017/6/22.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 contentList 元素对象协议，这里使delagate代替model，方便扩展
 */
@protocol BMSelectorObjectDelegate <NSObject>
@required
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) BOOL selected;
@end
