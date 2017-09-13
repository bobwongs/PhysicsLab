//
//  BMTextLineCell.m
//  BMBlueMoonAngel
//
//  Created by BobWong on 2017/6/13.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMTextLineCell.h"

@implementation BMTextLineCell

- (void)setTitle:(NSString *)title {
    _title = [title copy];
    self.containerView.titleLabel.text = _title;
}

- (void)setContent:(NSString *)content {
    _content = [content copy];
    self.containerView.contentLabel.text = _content;
}

- (void)setLineHidden:(BOOL)lineHidden {
    _lineHidden = lineHidden;
    self.containerView.lineView.hidden = lineHidden;
}

@end
