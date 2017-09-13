//
//  BMSelectorView.h
//  BMBlueMoonAngel
//
//  Created by fenglh on 2017/6/21.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMSelectorObjectDelegate.h"
@class BMSelectorView;

@protocol BMSelectorViewDelegate <NSObject>
- (void)selectorView:(BMSelectorView*)selectorView  didSelectedIndex:(NSInteger)index;
@end


@interface BMSelectorView : UIView
@property (nonatomic, strong) NSArray<id<BMSelectorObjectDelegate>> *contentList;
@property (nonatomic, strong) id<BMSelectorViewDelegate> delegate;
@end
