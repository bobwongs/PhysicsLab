//
//  BMLoginUserManager.m
//  BWPhysicsLab
//
//  Created by BobWong on 2016/10/21.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "BMLoginUserManager.h"
//#import <TMCache.h>
//#import "BMUserGetInfoAPIManager.h"



//在BMGlobalConfigure.h文件中使用extern关键字提示
NSString *BMLoginUserNickNameKeyPath = @"nickName";
NSString *BMLoginUserUserNameKeyPath = @"userName";
NSString *BMLoginUserPwdKeyPath = @"pwd";
NSString *BMLoginUserTokenKeyPath = @"token";
NSString *BMLoginUserHeaderImageUrlKeyPath = @"headerImageUrl";
NSString *BMLoginUserLoginStatusKeyPath = @"loginStatus";
NSString *BMLoginUserBalanceKeyPath = @"balance";
NSString *BMLoginUserCartCount = @"cartCount";

NSString *BMNotificationUserInfoChange = @"BMNotificationUserInfoChange";
NSString *BMNotificationCartNumChange = @"BMNotificationCartNumChange";  // 购物车数量变化


@interface BMLoginUserManager ()
@property (nonatomic, readwrite,strong) BMLoginUserModel *loginedUserModel;//已登录用户model

//接口
//@property (nonatomic, strong) BMUserGetInfoAPIManager *getUserInfoAPIManager;//获取用户信息
//@property (nonatomic ,assign) NSUInteger getUserInfoRequestId;


@end
@implementation BMLoginUserManager

- (void)dealloc
{
    [self.loginedUserModel removeObserver:self forKeyPath:BMLoginUserNickNameKeyPath];
    [self.loginedUserModel removeObserver:self forKeyPath:BMLoginUserUserNameKeyPath];
    [self.loginedUserModel removeObserver:self forKeyPath:BMLoginUserPwdKeyPath];
    [self.loginedUserModel removeObserver:self forKeyPath:BMLoginUserTokenKeyPath];
    [self.loginedUserModel removeObserver:self forKeyPath:BMLoginUserLoginStatusKeyPath];
    [self.loginedUserModel removeObserver:self forKeyPath:BMLoginUserHeaderImageUrlKeyPath];
    [self.loginedUserModel removeObserver:self forKeyPath:BMLoginUserCartCount];
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static BMLoginUserManager *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BMLoginUserManager alloc] init];
        [sharedInstance initDataFromDiskCache];
        [sharedInstance addKVO];
    });
    return sharedInstance;
}

- (void)addKVO
{
    [self.loginedUserModel addObserver:self forKeyPath:BMLoginUserNickNameKeyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.loginedUserModel addObserver:self forKeyPath:BMLoginUserUserNameKeyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.loginedUserModel addObserver:self forKeyPath:BMLoginUserPwdKeyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.loginedUserModel addObserver:self forKeyPath:BMLoginUserTokenKeyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.loginedUserModel addObserver:self forKeyPath:BMLoginUserHeaderImageUrlKeyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.loginedUserModel addObserver:self forKeyPath:BMLoginUserLoginStatusKeyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.loginedUserModel addObserver:self forKeyPath:BMLoginUserBalanceKeyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.loginedUserModel addObserver:self forKeyPath:BMLoginUserCartCount options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
 
    
    id oldObject = [change objectForKey:NSKeyValueChangeOldKey];
    id newObject = [change objectForKey:NSKeyValueChangeNewKey];
    
    if ([keyPath isEqualToString:BMLoginUserCartCount]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:BMNotificationCartNumChange object:nil];
    }
    else if ([newObject isKindOfClass:[NSString class]]) {
        if (![oldObject isEqualToString:newObject]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:BMNotificationUserInfoChange object:keyPath];
        }
    }
    else if([newObject isKindOfClass:[NSNumber class]]){
        if ([newObject integerValue] != [oldObject integerValue]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:BMNotificationUserInfoChange object:keyPath];
        }
    }
    else{
        [[NSNotificationCenter defaultCenter] postNotificationName:BMNotificationUserInfoChange object:keyPath];
    }
    
    [self cacheToDisk];
    
}

- (void)clean
{
    self.loginedUserModel.nickName = @"";
    self.loginedUserModel.userName = @"";
    self.loginedUserModel.pwd = @"";
    self.loginedUserModel.token = @"";
    self.loginedUserModel.headerImageUrl = @"";
//    self.loginedUserModel.loginStatus = BMUserLoginStatusUnLogin;
    self.loginedUserModel.balance = 0;
    self.loginedUserModel.cartCount = 0;
    [self cacheToDisk];
}



- (void)cacheToDisk
{
//    NSLog(@"缓存loginedUserModel到本地:%@",self.loginedUserModel);
    [self archiver];
}


- (void)asynUpdateUserInfo
{
//    if ([BMLoginUserManager sharedInstance].loginedUserModel.loginStatus == BMUserLoginStatusLoginNormal) {
//        NSLog(@"接口请求->获取用户信息!");
//        self.getUserInfoRequestId = [self.getUserInfoAPIManager loadData];
//    }
}

- (void)initDataFromDiskCache
{
    NSLog(@"从本地缓存获取loginedUserModel:%@",self.loginedUserModel);
    BMLoginUserModel *loginUserModel = [self unArchiver];
    if (loginUserModel) {
        self.loginedUserModel = loginUserModel;
    }
}

- (BOOL)checkLoginStatus {
//    if ([BMLoginUserManager sharedInstance].loginedUserModel.loginStatus != BMUserLoginStatusLoginNormal) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:BMNotificationRequestLogin object:nil];
//        return NO;
//    }
    return YES;
}


- (void)archiver
{
    //进行归档
    NSString *path = [self archiverPath];
    [NSKeyedArchiver archiveRootObject:self.loginedUserModel toFile:path];
    
}

//反归档
- (BMLoginUserModel *)unArchiver
{
    NSString *path=[self archiverPath];
    BMLoginUserModel *model = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return model;
    
}

- (NSString *)archiverPath
{
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path=[docPath stringByAppendingPathComponent:@"person.info"];
    return path;
}

- (BMLoginUserModel *)loginedUserModel
{
    if (_loginedUserModel == nil) {
        _loginedUserModel = [[BMLoginUserModel alloc] init];
    }
    return _loginedUserModel;
}

#pragma mark - 归档

@end
