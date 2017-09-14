//
//  BMShoppingCartView.m
//  BWPhysicsLab
//
//  Created by BobWong on 2017/2/14.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BMShoppingCartView.h"
#import "UIView+BMExtension.h"

@interface BMShoppingCartView ()

@property (weak, nonatomic) IBOutlet UILabel *angleCountLabel; ///< 角标 label
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView; ///< 购物车 icon

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cornerWidth;

@end

@implementation BMShoppingCartView

#pragma mark -

#pragma mark - init

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.angleCountLabel.clipsToBounds = YES;
    self.angleCountLabel.layer.cornerRadius = 12.0 / 2;
    self.angleCountLabel.textAlignment = 1;
}

#pragma mark - getters setters

- (void)setAngleCount:(NSInteger)angleCount {
    _angleCount = angleCount;
    
    self.angleCountLabel.text = @(angleCount).stringValue;
}

- (void)setImageName:(NSString *)imageName {

    _imageName = imageName;
    self.iconImageView.image = [UIImage imageNamed:imageName];
}

#pragma mark - 公有方法

+ (instancetype)shoppingCartViewWithAngleCount:(NSInteger)angleCount clickBlock:(dispatch_block_t)block {
    
    BMShoppingCartView *shoppingCartView = [self bm_viewFormXib];
    shoppingCartView.backgroundColor = [UIColor clearColor];
    shoppingCartView.angleCount = angleCount;
    shoppingCartView.block = block;
    return shoppingCartView;
}

#pragma mark - 事件响应

- (IBAction)buttonClick {
    
    if (self.block) {
        self.block();
    }
}

@end
