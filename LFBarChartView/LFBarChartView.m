//
//  LFBarChartView.m
//  LFBarChartView
//
//  Created by prudent on 14/11/16.
//  Copyright (c) 2014年 prudent. All rights reserved.
//

#import "LFBarChartView.h"
#import "LFBarChartOne.h"
#import "UIView+NJ.h"

#define LFBARCHARTONE_TAG 9999

@interface LFBarChartView ()
{
    /** 线的个数 */
    int _numChart;
    /** 柱状图的间距 */
    float _chartViewGap;
    /** 柱状图高度 */
    float _chartHeightRatio;
    /** 获得全部柱状图柱子 */
    NSMutableArray *_chartArray;
}
/** 定时器 */
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation LFBarChartView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //设置柱状图的属性
        [self setupCommon];
        
    }
    return self;
}


- (void)startDrawBarChartView
{
    if ([self.dataSource respondsToSelector:@selector(numberOfBarChatView:)]) {
        _numChart  = [self.dataSource numberOfBarChatView:self];
    }
    
    if ([self.delegate respondsToSelector:@selector(barChartViewWithgap:)]) {
        _chartViewGap  = [self.delegate barChartViewWithgap:self];
    }
    
    if ([self.dataSource respondsToSelector:@selector(heightOfBarChatView:)]) {
        _chartHeightRatio  = [self.delegate heightOfBarChatView:self];
    }

    // 开始绘制
    [self toDoDrawBarChart];
}

- (void)toDoDrawBarChart
{
//    // 清空
//    [self commonClean];
    
    CGFloat graphViewW = (self.frame.size.width - _chartViewGap * (_numChart -1))/_numChart;
    CGFloat graphViewH = 0;
    
    NSArray *heightArray = self.dataArray[0];
    NSArray *cityNameArray = self.dataArray[1];
    // 添加柱状图
    for (int i = 0; i < _numChart; i++) {
        
        CGFloat graphViewX = (graphViewW + _chartViewGap) * i;
        CGFloat graphViewY = 0;
        if ([self.delegate respondsToSelector:@selector(isneedFooterLabel:)] && [self.delegate isneedFooterLabel:nil]) {
            graphViewY = 20;
        }
        
        LFBarChartOne *barChartView = [[LFBarChartOne alloc] initWithFrame:CGRectMake(graphViewX, graphViewY, graphViewW, graphViewH)];
        barChartView.height = self.height;
        barChartView.tag = LFBARCHARTONE_TAG + i;
        barChartView.maxHeight = [heightArray[i] floatValue] / _chartHeightRatio;
        
        //是否需要点击功能
        if ([self.delegate respondsToSelector:@selector(isNeedClick)] && [self.delegate isNeedClick]) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.tag = LFBARCHARTONE_TAG + 1000 + i;
            btn.frame = CGRectMake(graphViewH, 0, graphViewW, [heightArray[i] floatValue] / _chartHeightRatio);
            [btn addTarget:self action:@selector(changeHeightBG:) forControlEvents:UIControlEventTouchUpInside];
            [barChartView addSubview:btn];
        }

        //是否需要头文字
        if ([self.delegate respondsToSelector:@selector(isNeedHeaderLabel:)] && [self.delegate isNeedHeaderLabel:barChartView.numLabel]) {
            barChartView.numLabel.text = heightArray[i];
        }
        
        //是否需求体文字
        if ([self.delegate respondsToSelector:@selector(isNeedBodyLabel:)] && [self.delegate isNeedBodyLabel:barChartView.numberLabel]) {
            barChartView.numberLabel.text = heightArray[i];
        }
        
        //是否需要尾文字
        if ([self.delegate respondsToSelector:@selector(isneedFooterLabel:)] && [self.delegate isneedFooterLabel:barChartView.cityLabel]) {
            barChartView.cityLabel.text = cityNameArray[i];
        }
        
        [self addSubview:barChartView];
        
        [_chartArray addObject:barChartView];
        
    }
    CGAffineTransform transform = CGAffineTransformMakeRotation(-M_PI_2 * 2);
    self.transform = transform;
    
    if ([self.delegate respondsToSelector:@selector(getAllBarChartView:)]) {
        [self.delegate getAllBarChartView:_chartArray];
    }
}

- (void)changeHeightBG:(UIButton* )button
{
    for (int i = 0 ; i < _chartArray.count ; i++) {
        LFBarChartOne *chartView = _chartArray[i];
        if (chartView.tag == button.tag - 1000) {
            for (UIView *temp in chartView.subviews) {
                if ([temp isKindOfClass:[UIButton class]] && temp.tag != button.tag) {
                    UIView *imageView = (UIButton* )temp;
                    imageView.backgroundColor = [UIColor colorWithRed:56/255.0 green:128/255.0 blue:237/255.0 alpha:1];
                }
            }
        } else {
            for (UIView *temp in chartView.subviews) {
                if ([temp isKindOfClass:[UIButton class]] && temp.tag == 0) {
                    UIView *imageView = (UIButton* )temp;
                    imageView.backgroundColor = [UIColor colorWithRed:188/255.0 green:215/255.0 blue:250/255.0 alpha:1];
                }
            }
        }
    }
}


- (void)setupCommon
{
    _chartViewGap = 20;
    _chartHeightRatio = 1;
    _chartArray = [[NSMutableArray alloc] init];
}

@end
