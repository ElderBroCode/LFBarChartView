//
//  UILabel+LF.m
//  HappigoStore
//
//  Created by Mical_LF on 16/1/25.
//  Copyright © 2016年 Mical_LF. All rights reserved.
//

#import "UILabel+LF.h"

@implementation UILabel (LF)

+ (UILabel *)initWithFrame:(CGRect)frame
                      Font:(UIFont*)font
                TextString:(NSString *)text
             TextAlignment:(NSTextAlignment)alignment
             MasksToBounds:(BOOL)masksToBounds
                 TextColor:(UIColor*)textColor
               BorderWidth:(CGFloat)floatNumber
               BorderColor:(UIColor*)borderColor
{
   UILabel *label = [[UILabel alloc] initWithFrame:frame];
   label.font = font;
   label.text = text;
   label.textAlignment = alignment;
   label.layer.masksToBounds = masksToBounds;
   label.layer.borderColor = borderColor.CGColor;
   label.layer.borderWidth = floatNumber;
   
   return label;
}

+ (NSMutableAttributedString *)initWithSalePriceText:(NSString *)salePrice andMarketPriceText:(NSString *)marketPrice
{
   //人民币符号
   NSDictionary *flagFormat = @{
                                NSFontAttributeName : [UIFont systemFontOfSize:13.0f],
                                NSForegroundColorAttributeName : [UIColor colorWithWhite:30.0f / 255.0f alpha:1.0f],
                                };
   
   //黑色价格
   NSDictionary *pricesBlackFormat = @{
                                       NSFontAttributeName : [UIFont systemFontOfSize:18.0f],
                                       NSForegroundColorAttributeName : [UIColor colorWithWhite:30.0f / 255.0f alpha:1.0f],
                                       };
   
   //灰色价格
   NSDictionary *pricesGrayFormat = @{
                                      NSFontAttributeName : [UIFont systemFontOfSize:13.0f],
                                      NSForegroundColorAttributeName : [UIColor colorWithWhite:150.0f / 255.0f alpha:1.0f],
                                      NSStrikethroughStyleAttributeName : @1,
                                      };
   
   
   
   NSMutableAttributedString *attString;
   attString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥%.2f ¥%.2f", [salePrice floatValue], [marketPrice floatValue]]];
   [attString addAttributes:flagFormat range:NSMakeRange(0, 1)];
   NSString *leftStr = [NSString stringWithFormat:@"%d", [salePrice intValue]];
   [attString addAttributes:pricesBlackFormat range:NSMakeRange(1, leftStr.length + 4)];
   [attString addAttributes:pricesGrayFormat range:NSMakeRange(leftStr.length + 4, marketPrice.length + 1)];
   [attString addAttributes:pricesGrayFormat range:NSMakeRange(attString.length - marketPrice.length - 1, marketPrice.length + 1)];
   return attString;
}

@end
