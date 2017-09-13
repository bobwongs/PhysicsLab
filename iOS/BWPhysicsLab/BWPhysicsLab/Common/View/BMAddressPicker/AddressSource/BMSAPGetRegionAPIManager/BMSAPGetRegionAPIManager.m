//
//  BMSAPGetRegionAPIManager.m
//  BMWash
//
//  Created by BobWong on 2017/06/21.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.

#import "BMSAPGetRegionAPIManager.h"

#define INTERFACE_SAP_GET_REGION @"bmhr-control/personInfo/getRegionSelectSAP"  // SAP级联查询全国行政区域(省市县）

@implementation BMSAPGetRegionAPIManager

- (NSString *)interfaceUrl
{
    return INTERFACE_SAP_GET_REGION;
}

- (BOOL)useToken
{
    return YES;
}

@end
