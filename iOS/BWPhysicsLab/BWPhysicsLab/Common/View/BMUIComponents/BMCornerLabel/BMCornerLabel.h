//
//  BMCornerLabel.h
//  B2BMall
//
//  Created by elvin on 2017/9/8.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSInteger {
    BMCornerShowTypeDot,//超过十位数显示···
    BMCornerShowTypeplus//超过十位数显示+
}BMCornerShowType;

@interface BMCornerLabel : UILabel

//直接使用代码添加
- (void)updateCornerLabelWithCount:(NSInteger)count;//默认超过十位数显示···
- (void)updateCornerLabelWithCount:(NSInteger)count showType:(BMCornerShowType)type;//可设置超过十位数显示


//使用xib添加,把宽返回，在添加这个Label的地方修改约束的值使用
- (CGFloat)widthOfUpdateCornerLabelWithCount:(NSInteger)count;//默认超过十位数显示···
- (CGFloat)widthOfUpdateCornerLabelWithCount:(NSInteger)count showType:(BMCornerShowType)type;//可设置超过十位数显示

@end
