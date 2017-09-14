//
//  BMLoginUserModel.m
//  BWPhysicsLab
//
//  Created by BobWong on 2016/10/21.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "BMLoginUserModel.h"

@implementation BMLoginUserModel


- (NSString *)nickName
{
    if (_nickName == nil) {
        return @"";
    }
    return _nickName;
}

- (NSString *)userName
{
    if (_userName == nil) {
        return @"";
    }
    return _userName;
}

- (NSString *)pwd
{
    if (_pwd == nil) {
        return @"";
    }
    return _pwd;
}

- (NSString *)token
{
    if (_token == nil) {
        return @"";
    }
    return _token;
}
- (NSString *)headerImageUrl
{
    if (_headerImageUrl == nil) {
        return @"";
    }
    return _headerImageUrl;
}


//编码
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.nickName forKey:@"nickName"];
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.pwd forKey:@"pwd"];
    [aCoder encodeObject:self.token forKey:@"token"];
    [aCoder encodeObject:self.headerImageUrl forKey:@"headerImageUrl"];
//    [aCoder encodeObject:@(self.loginStatus) forKey:@"loginStatus"];
    [aCoder encodeObject:@(self.balance) forKey:@"balance"];
}

//解码
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.nickName = [aDecoder decodeObjectForKey:@"nickName"];
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.pwd = [aDecoder decodeObjectForKey:@"pwd"];
        self.token = [aDecoder decodeObjectForKey:@"token"];
        self.headerImageUrl = [aDecoder decodeObjectForKey:@"headerImageUrl"];
//        self.loginStatus = [[aDecoder decodeObjectForKey:@"loginStatus"] unsignedIntegerValue];
        self.balance = [[aDecoder decodeObjectForKey:@"balance"] integerValue];
    }
    return self;
}
@end
