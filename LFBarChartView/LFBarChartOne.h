//
//  LFBarChartOne.h
//  LFBarChartView
//
//  Created by prudent on 14/11/16.
//  Copyright (c) 2014年 prudent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFBarChartOne : UIView

/** 大视图 */
@property (weak, nonatomic) UIButton *maxView;

/** 文字 */
@property (weak, nonatomic) UILabel *numLabel;

@property (weak, nonatomic) UILabel *cityLabel;

@property (assign, nonatomic) CGFloat maxHeight;

@property (weak, nonatomic) UILabel *numberLabel;

@end
