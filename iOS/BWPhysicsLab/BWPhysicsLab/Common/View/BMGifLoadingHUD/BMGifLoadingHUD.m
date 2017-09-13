//
//  BMGifLoadingHUD.m
//  B2BMall
//
//  Created by BobWong on 2017/8/30.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMGifLoadingHUD.h"
#import <FLAnimatedImage.h>

#define LOADING_HUD_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define LOADING_HUD_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface BMGifLoadingHUD ()

/* UI */
@property (strong, nonatomic) FLAnimatedImageView *gifImageView;
@property (strong, nonatomic) FLAnimatedImage *gifImage;

/* Data */
@property (assign, nonatomic) BOOL animating;  ///< Animating or not.

@end

@implementation BMGifLoadingHUD

#pragma mark - Life Cycle

+ (BMGifLoadingHUD *)sharedInstance {
    static BMGifLoadingHUD *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        [sharedInstance setUI];
    });
    return sharedInstance;
}

#pragma mark - Public Method

+ (void)show {
    [self showWithoutInteraction];
}

+ (void)showWithoutInteraction {
    [self sharedInstance].userInteractionEnabled = YES;
    [self showView];
}

+ (void)showWithInteraction {
    [self sharedInstance].userInteractionEnabled = NO;
    [self showView];
}

+ (void)showView {
    BMGifLoadingHUD *hud = [self sharedInstance];
    hud.animating = YES;
    [hud.gifImageView startAnimating];  // Start corresponding to stop in dismiss, improve performance.
    UIView *keyWindow = [UIApplication sharedApplication].keyWindow;
    if (hud.superview == keyWindow) return;  // 存在Loading
    
    [keyWindow addSubview:hud];
    [UIView animateWithDuration:.25 animations:^{
        hud.alpha = 1;
    } completion:^(BOOL finished) {
        hud.animating = NO;
    }];
}

+ (void)dismiss {
    BMGifLoadingHUD *hud = [self sharedInstance];
    hud.animating = YES;
    [UIView animateWithDuration:.25 animations:^{
        hud.alpha = 0;
    } completion:^(BOOL finished) {
        [self finishDismiss];
        [self sharedInstance].animating = NO;
    }];
}

+ (void)dismissWithoutAnimation {
    [self sharedInstance].alpha = 0;
    [self finishDismiss];
}

+ (void)finishDismiss {
    [[self sharedInstance] removeFromSuperview];
    [[self sharedInstance].gifImageView stopAnimating];
}

+ (void)setGifImage:(FLAnimatedImage *)gifImage {
    if (gifImage) [self sharedInstance].gifImageView.animatedImage = gifImage;
}

#pragma mark - Private Method

- (void)setUI {
    self.frame = [UIScreen mainScreen].bounds;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"bm_default_loading" ofType:@"gif"];
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfFile:filePath]];
    
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    self.gifImageView = imageView;
    if (image) imageView.animatedImage = image;
    imageView.frame = CGRectMake(0.0, 0.0, 44.0, 44.0);
    imageView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    [self addSubview:imageView];
}

@end
