//
//  UIScrollView+LF.h
//  HappigoStore
//
//  Created by Mical_LF on 16/1/25.
//  Copyright © 2016年 Mical_LF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (LF)

+ (UIScrollView *)initWithFrame:(CGRect)frame
                    contentSize:(CGSize)size
                        bounces:(BOOL)bounces
                  scrollEnabled:(BOOL)scrollEnabled
   showsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator
 showsHorizontalScrollIndicator:(BOOL)showsHorizontalScrollIndicator
                  pagingEnabled:(BOOL)pagingEnabled;

@end
