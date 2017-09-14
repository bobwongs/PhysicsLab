//
//  BWUIMacroDefinition.h
//  BWPhysicsLab
//
//  Created by BobWong on 2017/9/13.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#ifndef BWUIMacroDefinition_h
#define BWUIMacroDefinition_h

/* -------------------- Color -------------------- */

// 基本颜色
#define BMb2b_brand_color1_start [UIColor colorWithHexString:@"3EB4FF"]  // 影响主流程的控件：按钮、icon，起始渐变色
#define BMb2b_brand_color1_end [UIColor colorWithHexString:@"0378FF"]  // 终止渐变色
#define BMb2b_brand_color2_start [UIColor colorWithHexString:@"FFA909"]  // 与购物相关流程的按钮，起始渐变色
#define BMb2b_brand_color2_end [UIColor colorWithHexString:@"FF682A"]  // 终止渐变色

#define BMb2b_brand_color1 @[BMb2b_brand_color1_start, BMb2b_brand_color1_end]
#define BMb2b_brand_color2 @[BMb2b_brand_color2_start, BMb2b_brand_color2_end]

#define BMb2b_brand_white_colors @[[UIColor whiteColor], [UIColor whiteColor]]


// 辅助颜色
#define BMb2b_sub_color1 [UIColor colorWithHexString:@"0378FF"]  // 可点击字段、提示语颜色、状态显示颜色
#define BMb2b_sub_color2 [UIColor colorWithHexString:@"FF7F1E"]  // 金额颜色
#define BMb2b_sub_color3 [UIColor colorWithHexString:@"FF682A"]  // 角标颜色
#define BMb2b_page_color [UIColor colorWithHexString:@"F2F5F9"]  // 页面底色
#define BMb2b_line_color [UIColor colorWithHexString:@"DCE2EA"]  // 分隔线颜色

// 字体颜色
#define BMb2b_text_color1 [UIColor colorWithHexString:@"071A47"]  // 标题、正文
#define BMb2b_text_color2 [UIColor colorWithHexString:@"80848C"]  // 副标题、补充内容
#define BMb2b_text_color3 [UIColor colorWithHexString:@"C0C4CD"]  // 提示语、小标题

// 其他
#define BMb2b_AFD0F8 [UIColor colorWithHexString:@"AFD0F8"]  // 浅白色
#define BMb2b_F8C4AF [UIColor colorWithHexString:@"F8C4AF"]  // 浅橙色
#define BMb2b_FFEDDF [UIColor colorWithHexString:@"FFEDDF"]  // 浅白橙色
#define BMb2b_DBECFF [UIColor colorWithHexString:@"DBECFF"]  // 浅灰色


/* -------------------- Font -------------------- */

#define BMb2b_t1 [UIFont systemFontOfSize:20.0]  // 总金额显示、提示页面正文
#define BMb2b_t2 [UIFont systemFontOfSize:16.0]  // btn文字(大按钮、弹窗按钮)、数量、页面标题
#define BMb2b_t3 [UIFont systemFontOfSize:14.0]  // 标题、正文
#define BMb2b_t4 [UIFont systemFontOfSize:12.0]  // 正文、小标题
#define BMb2b_t5 [UIFont systemFontOfSize:10.0]  // 提示语、小标题

//加粗
#define BMb2b_t1_b [UIFont boldSystemFontOfSize:20.0]  // 总金额显示、提示页面正文
#define BMb2b_t2_b [UIFont boldSystemFontOfSize:16.0]  // btn文字(大按钮、弹窗按钮)、数量、页面标题
#define BMb2b_t3_b [UIFont boldSystemFontOfSize:14.0]  // 标题、正文
#define BMb2b_t4_b [UIFont boldSystemFontOfSize:12.0]  // 正文、小标题
#define BMb2b_t5_b [UIFont boldSystemFontOfSize:10.0]  // 提示语、小标题


/* -------------------- Space -------------------- */

#define BMb2b_gap_24 24.0  // 页面元素间最大间距、明显分离元素
#define BMb2b_gap_12 12.0  // 页面左右间距；元素间标准间距
#define BMb2b_gap_8 8.0  // 属性不同但有关联关系的元素间间距
#define BMb2b_gap_4 4.0  // 同一模块内标题与正文上下间距
#define BMb2b_gap_2 2.0  // 紧密联系并共同表达一个功能的元素间距

#endif /* BWUIMacroDefinition_h */
