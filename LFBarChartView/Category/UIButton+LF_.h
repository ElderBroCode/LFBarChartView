//
//  UIButton+LF_.h
//  HappigoStore
//
//  Created by Mical_LF on 16/1/25.
//  Copyright © 2016年 Mical_LF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LF_)

+ (instancetype)initWithFrame:(CGRect)frame
           buttonType:(UIButtonType)buttonType
          normalImage:(NSString *)normalImage
          selectImage:(NSString *)selectImage
               target:(id)target
               action:(SEL)action
                 Font:(UIFont*)font
            titleText:(NSString *)titleText;
@end
