//
//  BMCornerLabel.m
//  B2BMall
//
//  Created by elvin on 2017/9/8.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMCornerLabel.h"

@interface BMCornerLabel(){
    
}

@end

@implementation BMCornerLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setUI];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    //默认样式
    self.backgroundColor = [UIColor bm_colorWithHexString:@"ff6c47"];
    self.textColor = [UIColor bm_colorWithHexString:@"ffffff"];
    self.font = [UIFont systemFontOfSize:10];
    self.textAlignment = NSTextAlignmentCenter;
    self.layer.cornerRadius = 6;
    self.clipsToBounds = YES;
    self.hidden = YES;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)updateCornerLabelWithCount:(NSInteger)count{
    [self updateCornerLabelWithCount:count showType:BMCornerShowTypeDot];
}
- (void)updateCornerLabelWithCount:(NSInteger)count showType:(BMCornerShowType)type{
    [self widthOfUpdateCornerLabelWithCount:count showType:type];
}

- (CGFloat)widthOfUpdateCornerLabelWithCount:(NSInteger)count{
    return [self widthOfUpdateCornerLabelWithCount:count showType:BMCornerShowTypeDot];
}

- (CGFloat)widthOfUpdateCornerLabelWithCount:(NSInteger)count showType:(BMCornerShowType)type{
    CGFloat width = 0;
    if (count < 0 || count == 0) {//0和负数不显示
        self.hidden = YES;
        return 0;
    }
    self.hidden = NO;
    NSString *textStr = @"";
    if (count >0 && count <10) {//0到9
        [self setFrame:CGRectMake(BMView_X(self), BMView_Y(self), 12, 12)];
        textStr = [NSString stringWithFormat:@"%@",@(count)];
        width = 12;
    }else if (9< count && count<100) {//10到99
        [self setFrame:CGRectMake(BMView_X(self), BMView_Y(self), 18, 12)];
        textStr = [NSString stringWithFormat:@"%@",@(count)];
        width = 18;
    }else if (count > 99){//100以上
        switch (type) {
            case BMCornerShowTypeDot:{
                [self setFrame:CGRectMake(BMView_X(self), BMView_Y(self), 18, 12)];
                textStr = @"···";
                width = 18;
            }
                break;
            case BMCornerShowTypeplus:{
                [self setFrame:CGRectMake(BMView_X(self), BMView_Y(self), 24, 12)];
                textStr = @"99+";
                width = 24;
            }
                break;
            default:
                break;
        }
    }
    self.text = textStr;
    return width;
}

@end
