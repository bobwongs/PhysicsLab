//
//  BWMacroDefinition.h
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/13.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#ifndef BWMacroDefinition_h
#define BWMacroDefinition_h

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define UIFontBoldSystemOfSize(size) [UIFont boldSystemFontOfSize:size]

#define BMFloatEquation(A, B) (ABS(A-B) <= 0.0001)  // 浮点数是否相等的判断，精确度到0.0001

#define BM_DEVICE_SCREEN_3_5_INCH (SCREEN_HEIGHT < 567.0)  // 用567确保浮点数的判断准确
#define BM_DEVICE_SCREEN_4_INCH (BMFloatEquation(SCREEN_HEIGHT, 568.0))
#define BM_DEVICE_SCREEN_4_7_INCH (BMFloatEquation(SCREEN_HEIGHT, 667.0))
#define BM_DEVICE_SCREEN_5_5_INCH (BMFloatEquation(SCREEN_HEIGHT, 736.0))

/* ---------- 检查系统版本 ---------- */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#endif /* BWMacroDefinition_h */
