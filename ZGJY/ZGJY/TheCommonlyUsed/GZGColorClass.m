//
//  GZGColorClass.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGColorClass.h"

@implementation GZGColorClass

@end
@implementation GZGColorClass (TabBarOrNavBarColors)
/**
 *港中港背景颜色
 
 *@return Color
 */

+ (UIColor *)gzgBackClolor{return [@"eae7e7" hexStringToColor];}
/**
 *NavBarColor
 
 @return Color
 */
+ (UIColor *)gzgNavBarBackColor{return [@"f94c4c" hexStringToColor];}
/**
 *TabBarTitle选中字体颜色
 
 *@return Color
 */
+ (UIColor *)subjectTabBarTitleColorX{return [@"de3430" hexStringToColor];}
/**
 *TabBarTitle未选中字体颜色
 
 *@return Color
 */
+ (UIColor *)subjectTabBarTitleColor{return [@"353535" hexStringToColor];}

/**
 *Search Cancle 取消的颜色
 *@return Color
 */
+ (UIColor *)subjectSearchTextColor{return [@"a4a4a4" hexStringToColor];}
@end
@implementation GZGColorClass (GlobalPurchasingColor)
/**
 *  全球购 火力拼团 背景色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupBackgroundColor {return [@"faefcf" hexStringToColor];}
/**
 *  全球购 火力拼团 clear
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupClearColor {return [UIColor clearColor];}
/**
 *  全球购 火力拼团 已售背景色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupSoldBackgroundColor {return [@"b8b8b8" hexStringToColor];}
/**
 *  全球购 火力拼团 剩余背景色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupRemainingBackgroundColor {return [@"9a978e" hexStringToColor];}
/**
 *   全球购 火力拼团 已售 剩余 字体颜色
 */
+ (UIColor *)subjectGPSpellGroupSoldAndRemainingTextColor{return [@"ffffff" hexStringToColor];}
/**
 *  全球购 火力拼团 数字颜色
 */
+ (UIColor *)subjectGPSpellGroupTitleColor {return [@"fb1a42" hexStringToColor];}
/**
 *  全球购 火力拼团 商品与原产地字体颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupGoodsTextColor {return [@"8c837a" hexStringToColor];}
/**
 *  全球购 火力拼团 商品标签颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupGoodsLabelColor {return [@"fc7c84" hexStringToColor];}
/**
 *  全球购 火力拼团 虚线颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupDottedLineColor {return [@"8c837a" hexStringToColor];}
/**
 *  全球购 火力拼团 限制背景色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupLimitBackgroundColor {return [@"fbb7aa" hexStringToColor];}
/**
 *  全球购 火力拼团 限制字体颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupLimitTextColor {return [@"1b1b1b" hexStringToColor];}
/**
 *  全球购 火力拼团 进货 Normal 颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupReplenishOnrNormalBackgroundColor {return [@"ff0234" hexStringToColor];}
/**
 *  全球购 火力拼团 进度条的进度颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupProgressTintColor {return [@"fd7981" hexStringToColor];}
/**
 *  全球购 火力拼团 百分比颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupPercentageTextColor {return [@"fbb1a6" hexStringToColor];}
@end
@implementation GZGColorClass (GlobalPurchaCrossBord)

/**
 跨界直邮颜色1

 @return Color
 */
+ (UIColor *)subjectGlobaCrossBorsOne{return [@"f0dfce" hexStringToColor];}
/**
 跨界直邮颜色2
 
 @return Color
 */
+ (UIColor *)subjectGlobaCrossBorsTow{return [@"e5dbb2" hexStringToColor];}
/**
 跨界直邮颜色3
 
 @return Color
 */
+ (UIColor *)subjectGlobaCrossBorsThree{return [@"e6d9d4" hexStringToColor];}
/**
 跨界直邮颜色4
 
 @return Color
 */
+ (UIColor *)subjectGlobaCrossBorsFore{return [@"d6f6f6" hexStringToColor];}

@end
@implementation GZGColorClass (GlobalCountriesPacilionColor)
/**
 国家馆商品字体颜色
 
 @return Color
 */
+ (UIColor *)subjectCountriesPacilionGoodsTitleColor{return [@"675f5f" hexStringToColor];}

/**
 *韩国馆Nac背景颜色

 *@return Color
 */
+ (UIColor *)subjectCountriespacilionSouthKoreaNavColor{return [@"E0334B" hexStringToColor];}
/**
 *韩国馆背景颜色
 
 *@return Color
 */
+ (UIColor *)subjectCountriespacilionSouthKoreaBackColor{return [@"ff95a1" hexStringToColor];}

/**
 *日本馆背景颜色
 
 *@return Color
 */
+ (UIColor *)subjectCountriespacilionJapanBackColor{return [@"f7a13e" hexStringToColor];}
/**
 *澳大利亚馆背景颜色
 
 *@return Color
 */
+ (UIColor *)subjectCountriespacilionAustraliaBackColor{return [@"57c5e6" hexStringToColor];}
/**
 *欧洲馆背景颜色
 
 *@return Color
 */
+ (UIColor *)subjectCountriespacilionTheEuropeanBackColor{return [@"bb63b9" hexStringToColor];}


@end

@implementation GZGColorClass (GradientColor)

/**
 国家馆颜色渐变

 @param frame    CGrect Frame
 @param colorOne ColorOne
 @param colorTow ColorTow

 @return Color
 */
+ (CAGradientLayer *)doubleGradientColor:(CGRect)frame colorOne:(UIColor *)colorOne colorTow:(UIColor *)colorTow{
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.frame = frame;
    gradientLayer.colors = [NSArray arrayWithObjects:(id)colorOne.CGColor,(id)colorTow.CGColor, nil];
    return gradientLayer;
}

/**
 国家馆HeadFaceSelect颜色
 
 @return Color
 */
+ (UIColor *)subjectCountriesHeadFaceSelectTitleColor{return [@"d95c68" hexStringToColor];}

/**
 国家馆取消HeadFaceSelect颜色

 @return Color
 */
+ (UIColor *)subjectCountriesHeadFaceCancleSelectTitleColor{return [@"787878" hexStringToColor];}

/**
 国家馆HeadFace内容 进口字体颜色

 @return Color
 */
+ (UIColor *)subjectCountriesCountImportTitleColor{return [@"636260" hexStringToColor];}

/**
 国家馆HeadFace内容名字颜色

 @return Color
 */
+ (UIColor *)subjectCountriesCountNameTitleColor{return [@"000000" hexStringToColor];}

/**
 国家馆HeadFace商品质量字体颜色

 @return Color
 */
+ (UIColor *)subjectCountriesCountQualityTitleColor{return [@"ed4c60" hexStringToColor];}


/**
 国家馆CellBack颜色
 
 @return Color
 */
+ (UIColor *)subjectCountriesCountCellBackColor{return [@"fbd0d8" hexStringToColor];}

/**
 国家馆韩国馆CellCollectionBakcColor颜色
 
 @return Color
 */
+ (UIColor *)subjectCountriesSouthKoreaCellCollectionBackColor{return [@"ed4c60" hexStringToColor];}

/**
 国家馆日本CellCollectionBakcColor颜色
 
 @return Color
 */
+ (UIColor *)subjectCountriesJapanCellCollectionBackColor{return [@"f08f30" hexStringToColor];}

/**
 国家馆澳亚里亚CellCollectionBakcColor颜色
 
 @return Color
 */
+ (UIColor *)subjectCountriesAustraliaCellCollectionBackColor{return [@"48b9e1" hexStringToColor];}

/**
 国家馆欧洲CellCollectionBakcColor颜色
 
 @return Color
 */
+ (UIColor *)subjectCountriesTheEuropeanCellCollectionBackColor{return [@"a849a9" hexStringToColor];}

@end
@implementation GZGColorClass (SearchListColor)

/**
 *  搜索列表 背景色
 */
+ (UIColor *)subjectSearchListBackgroundColor {return [@"f3f3f3" hexStringToColor];}
/**
 *  搜索列表 字体颜色 没选中
 */
+ (UIColor *)subjectSearchListNormalTextColor {return [@"000000" hexStringToColor];}
/**
 *  搜索列表 字体颜色 选中
 */
+ (UIColor *)subjectSearchListSelectedTextColor {return [@"b63c39" hexStringToColor];}

@end

@implementation GZGColorClass (PersonalCenterColor)

/**
 *  个人中心 会员名称 颜色
 */
+ (UIColor *)subjectPersonalCenterColor {return [@"ffffff" hexStringToColor];}

@end
