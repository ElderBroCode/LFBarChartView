//
//  UIScrollView+LF.m
//  HappigoStore
//
//  Created by Mical_LF on 16/1/25.
//  Copyright © 2016年 Mical_LF. All rights reserved.
//

#import "UIScrollView+LF.h"

@implementation UIScrollView (LF)


+ (UIScrollView *)initWithFrame:(CGRect)frame
                    contentSize:(CGSize)size
                        bounces:(BOOL)bounces
                  scrollEnabled:(BOOL)scrollEnabled
   showsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator
 showsHorizontalScrollIndicator:(BOOL)showsHorizontalScrollIndicator
                  pagingEnabled:(BOOL)pagingEnabled

{
   UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
   scrollView.contentSize = size;
   scrollView.bounces = bounces;
   scrollView.scrollEnabled = scrollEnabled;
   scrollView.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
   scrollView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;
   scrollView.pagingEnabled = pagingEnabled;
   
   return scrollView;
}

@end
