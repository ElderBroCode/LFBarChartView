//
//  UIButton+LF_.m
//  HappigoStore
//
//  Created by Mical_LF on 16/1/25.
//  Copyright © 2016年 Mical_LF. All rights reserved.
//

#import "UIButton+LF_.h"

@implementation UIButton (LF_)

+ (instancetype)initWithFrame:(CGRect)frame
                 buttonType:(UIButtonType)buttonType
                normalImage:(NSString *)normalImage
                selectImage:(NSString *)selectImage
                     target:(id)target
                     action:(SEL)action
                       Font:(UIFont*)font
                  titleText:(NSString *)titleText
{
   UIButton *btn = [UIButton buttonWithType:buttonType];
   btn.frame = frame;
   if (normalImage != nil) {
      [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", normalImage]] forState:UIControlStateNormal];
   }
   if (selectImage != nil) {
      [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", selectImage]] forState:UIControlStateSelected];
   }
   if (font != nil) {
      btn.titleLabel.font = font;
   }
   if (titleText != nil) {
      [btn setTitle:titleText forState:UIControlStateNormal];
   }
   
   [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
   return  btn;
}

@end
