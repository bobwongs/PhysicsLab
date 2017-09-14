//
//  UIDevice+BWAdd.m
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/14.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "UIDevice+BWAdd.h"
#import <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>

@implementation UIDevice (BWAdd)

+ (NSString *)bm_getSystemInfoWithName:(char *)typeSpecifier
{
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    
    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    
    free(answer);
    return results;
}

+ (NSString *)bm_machine
{
    return [self bm_getSystemInfoWithName:"hw.machine"];
}

+ (BMDeviceType)bm_deviceType
{
    NSString *platform = [self bm_machine];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return BMDeviceTypeiPhone1;
    
    if ([platform isEqualToString:@"iPhone1"]) return BMDeviceTypeiPhone3;
    
    if ([platform hasPrefix:@"iPhone2"]) return  BMDeviceTypeiPhone3GS;
    
    if ([platform hasPrefix:@"iPhone3"]) return BMDeviceTypeiPhone4;
    
    if ([platform hasPrefix:@"iPhone4"]) return BMDeviceTypeiPhone4S;
    
    if ([platform hasPrefix:@"iPhone5,1"] || [platform hasPrefix:@"iPhone5,2"]) return BMDeviceTypeiPhone5;
    
    if ([platform hasPrefix:@"iPhone5,3"] || [platform hasPrefix:@"iPhone5,4"]) return BMDeviceTypeiPhone5C;
    
    if ([platform hasPrefix:@"iPhone6,1"] || [platform hasPrefix:@"iPhone6,2"]) return BMDeviceTypeiPhone5S;
    
    if ([platform hasPrefix:@"iPhone6,3"] || [platform hasPrefix:@"iPhone6,4"]) return BMDeviceTypeiPhone6;
    
    if ([platform hasPrefix:@"iPhone6,5"] || [platform hasPrefix:@"iPhone6,6"]) return BMDeviceTypeiPhone6Plus;
    
    if ([platform isEqualToString:@"iPod1,1"])   return BMDeviceTypeiPod1;
    
    if ([platform isEqualToString:@"iPod2,1"])   return BMDeviceTypeiPod2;
    
    if ([platform isEqualToString:@"iPod3,1"])   return BMDeviceTypeiPod3;
    
    if ([platform isEqualToString:@"iPod4,1"])   return BMDeviceTypeiPod4;
    
    if ([platform isEqualToString:@"iPod5,1"])   return BMDeviceTypeiPod5;
    
    if ([platform hasPrefix:@"iPad1"])   return BMDeviceTypeiPad1;
    
    if ([platform hasPrefix:@"iPad2"])   return BMDeviceTypeiPad2;
    
    if ([platform hasPrefix:@"iPad3"])   return BMDeviceTypeiPad3;
    
    if ([platform hasPrefix:@"iPhone"]) return BMDeviceTypeUnknowiPhone;
    
    if ([platform hasPrefix:@"iPod"]) return BMDeviceTypeUnknowiPod;
    
    if ([platform hasPrefix:@"iPad"]) return BMDeviceTypeUnknowiPad;
    
    if ([platform hasSuffix:@"86"] || [platform isEqual:@"x86_64"])
    {
        if ([[UIScreen mainScreen] bounds].size.width < 768)
            return BMDeviceTypeiPhoneSimulator;
        else
            return BMDeviceTypeiPadSimulator;
    }
    return BMDeviceTypeUnknow;
}

+ (NSString *)bm_macAddress
{
    int					mib[6];
    size_t				len;
    char				*buf;
    unsigned char		*ptr;
    struct if_msghdr	*ifm;
    struct sockaddr_dl	*sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    
    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    return [outstring uppercaseString];
}

+ (NSInteger)bm_getOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] integerValue];
}

+ (BOOL)bm_hasCamera
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

//屏幕分辨率
+ (NSString *)bm_screenSize{
    CGRect rect_screen = [[UIScreen mainScreen]bounds];
    CGFloat scale = [UIScreen mainScreen].scale;
    return [NSString stringWithFormat:@"%d*%d",(int)(rect_screen.size.width*scale),(int)(rect_screen.size.height * scale)] ;
}

//判断是否是retina屏幕
+ (BOOL)bm_isRetina{
    UIScreen *screen = [UIScreen mainScreen];
    if(screen.scale == 2){
        return YES;
    }else{
        return NO;
    }
}

+ (NSString *)bm_UUID{
    return [self bm_macAddress];
}

//把设备强制转成竖屏
+ (void)bm_resetDeviceInterFaceOrientationPortrait{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if (!UIDeviceOrientationIsPortrait(deviceOrientation)) {
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:YES];
        if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
            SEL selector = NSSelectorFromString(@"setOrientation:");
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
            [invocation setSelector:selector];
            [invocation setTarget:[UIDevice currentDevice]];
            int val = UIInterfaceOrientationPortrait;
            [invocation setArgument:&val atIndex:2];
            [invocation invoke];
        }
    }
}

@end
