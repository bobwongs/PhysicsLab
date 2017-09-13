//
//  NSString+BMExtension.h
//  B2BMall
//
//  Created by BobWong on 2017/9/8.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BMExtension)

/** 隐藏身份证中间8位 */
+ (NSString *)bm_staredIdCardNumber:(NSString *)idCardNumber;

/** 裁剪字符串中后面不跟内容的换行符 */
+ (NSString *)bm_clearLineBreakCharactor:(NSString *)text;

/** “分”为单位的转为显示字符串，格式：¥,##0.00 */
+ (NSString *)bm_moneyStringWithFen:(NSInteger)fenNumber;

/** “分”为单位的转为显示字符串，格式：,##0.00 */
+ (NSString *)bm_stringPositiveMoneyFormatWithFenNumber:(NSInteger)fenNumber;

/** “元”为单位的转为显示字符串，格式：,##0.00 */
+ (NSString *)bm_stringPositiveMoneyFormatWithYuanNumber:(double)yuanNumber;

@end
