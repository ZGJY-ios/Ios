//
//  GZGColorClass.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface GZGColorClass : NSObject
@end
@interface GZGColorClass (TabBarOrNavBarColors)

/**
 *港中港背景颜色

 *@return Color
 */
+ (UIColor *)gzgBackClolor;

/**
 *NavBarColor

 @return Color
 */
+ (UIColor *)gzgNavBarBackColor;

/**
 *TabBarTitle选中字体颜色

 *@return Color
 */
+ (UIColor *)subjectTabBarTitleColorX;

/**
 *TabBarTitle未选中字体颜色

 *@return Color
 */
+ (UIColor *)subjectTabBarTitleColor;
@end
@interface GZGColorClass (GlobalPurchasingColor)
/**
 *  全球购 火力拼团 背景色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupBackgroundColor;
/**
 *  全球购 火力拼团 clear
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupClearColor;
/**
 *  全球购 火力拼团 已售背景色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupSoldBackgroundColor;
/**
 *   全球购 火力拼团 已售 剩余 字体颜色
 */
+ (UIColor *)subjectGPSpellGroupSoldAndRemainingTextColor;
/**
 *  全球购 火力拼团 数字颜色
 */
+ (UIColor *)subjectGPSpellGroupTitleColor;
/**
 *  全球购 火力拼团 剩余背景色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupRemainingBackgroundColor;
/**
 *  全球购 火力拼团 商品与原产地字体颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupGoodsTextColor;
/**
 *  全球购 火力拼团 商品标签颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupGoodsLabelColor;
/**
 *  全球购 火力拼团 虚线颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupDottedLineColor;
/**
 *  全球购 火力拼团 限制背景色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupLimitBackgroundColor;
/**
 *  全球购 火力拼团 限制字体颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupLimitTextColor;
/**
 *  全球购 火力拼团 进货 Normal 颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupReplenishOnrNormalBackgroundColor;
/**
 *  全球购 火力拼团 进度条的进度颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupProgressTintColor;
/**
 *  全球购 火力拼团 百分比颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupPercentageTextColor;

@end
@interface GZGColorClass (GlobalPurchaCrossBord)
/**
 跨界直邮颜色1
 
 @return Color
 */
+ (UIColor *)subjectGlobaCrossBorsOne;
/**
 跨界直邮颜色2
 
 @return Color
 */
+ (UIColor *)subjectGlobaCrossBorsTow;
/**
 跨界直邮颜色3
 
 @return Color
 */
+ (UIColor *)subjectGlobaCrossBorsThree;
/**
 跨界直邮颜色4
 
 @return Color
 */
+ (UIColor *)subjectGlobaCrossBorsFore;

@end
@interface GZGColorClass (GlobalCountriesPacilionColor)
/**
 国家馆商品字体颜色

 @return Color
 */
+ (UIColor *)subjectCountriesPacilionGoodsTitleColor;

@end
