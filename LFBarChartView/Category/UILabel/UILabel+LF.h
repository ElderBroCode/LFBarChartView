//
//  UILabel+LF.h
//  HappigoStore
//
//  Created by Mical_LF on 16/1/25.
//  Copyright © 2016年 Mical_LF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LF)

+ (UILabel *)initWithFrame:(CGRect)frame
                      Font:(UIFont*)font
                TextString:(NSString *)text
             TextAlignment:(NSTextAlignment)alignment
             MasksToBounds:(BOOL)masksToBounds
                 TextColor:(UIColor*)textColor
               BorderWidth:(CGFloat)floatNumber
               BorderColor:(UIColor*)borderColor;

//价格
+ (NSMutableAttributedString *)initWithSalePriceText:(NSString *)salePrice andMarketPriceText:(NSString *)marketPrice;

@end
