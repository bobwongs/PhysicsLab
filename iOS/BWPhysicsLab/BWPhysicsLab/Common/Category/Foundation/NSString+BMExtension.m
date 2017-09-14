//
//  NSString+BMExtension.m
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/8.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "NSString+BMExtension.h"

@implementation NSString (BMExtension)

+ (NSString *)bm_staredIdCardNumber:(NSString *)idCardNumber {
    NSString *starString = @"********";
    NSUInteger length = idCardNumber.length;
    if (length <= 8) return starString;
    
    NSInteger fromIndex = ceil((length - 8) / 2.0);
    return [idCardNumber stringByReplacingCharactersInRange:NSMakeRange(fromIndex, 8) withString:starString];
}

+ (NSString *)bm_clearLineBreakCharactor:(NSString *)text {
    if (!text || text.length == 0) return @"";
    
    return [text stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
//    NSArray<NSString *> *array = [text componentsSeparatedByString:@"\n"];
//    __block NSString *result = @"";
//    [array enumerateObjectsUsingBlock:^(NSString * _Nonnull substring, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (substring && substring.length > 0) {
//            result = [result stringByAppendingString:[NSString stringWithFormat:@"%@\n", substring]];
//        }
//    }];
//    result = [result substringToIndex:result.length - 1];
//    return result;
}

+ (NSString *)bm_moneyStringWithFen:(NSInteger)fenNumber {
    NSString *string = [NSString stringWithFormat:@"¥%@",[self bm_stringPositiveMoneyFormatWithFenNumber:fenNumber]];
    return string;
}

+ (NSString *)bm_stringPositiveMoneyFormatWithFenNumber:(NSInteger)fenNumber {
    if(fenNumber == 0) return @"0.00";  // 为0
    
    double yuanNumber = fenNumber / 100.0;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setPositiveFormat:@",##0.00;"];  // #和0的效果是不一样的，#和0都有占位的效果，但是0相比于#有不同，如果该位置没有值，如果用了0的话，会显示为0，用#则不显示，示例：0.01，",000.00": 000.01，",##0.00": 0.01
    NSString *string = [formatter stringFromNumber:[NSNumber numberWithDouble:yuanNumber]];
    return string;
}

+ (NSString *)bm_stringPositiveMoneyFormatWithYuanNumber:(double)yuanNumber {
    double fenNumber = yuanNumber * 100.0;
    return [self bm_stringPositiveMoneyFormatWithFenNumber:fenNumber];
}

@end
