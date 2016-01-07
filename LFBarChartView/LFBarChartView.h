//
//  LFBarChartView.h
//  LFBarChartView
//
//  Created by prudent on 14/11/16.
//  Copyright (c) 2014年 prudent. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LFBarChartView;
/** 代理方法 */
@protocol LFBarChartViewDelegate <NSObject>
@optional

/** 是否需要头文字 */
- (BOOL)isNeedHeaderLabel:(UILabel* )headerLabel;

/** 是否需要体文字 */
- (BOOL)isNeedBodyLabel:(UILabel* )bodyLabel;

/** 是否需要尾文字 */
- (BOOL)isneedFooterLabel:(UILabel* )footerLabel;

/** 柱状图是否可以点击 */
- (BOOL)isNeedClick;

/** 柱状图的间隔 */
- (float)barChartViewWithgap:(LFBarChartView* )barChartView;

/** 柱子高度根据数值缩放比例 */
- (float)heightOfBarChatView:(LFBarChartView* )barChartView;

/** 获得全部的柱状图柱子 */
- (void)getAllBarChartView:(NSMutableArray* )chartArray;

@end

/** 数据源方法 */
@protocol LFBarChartViewDataSource <NSObject>
@required
/**
 *  柱子的个数
 *
 *  @return 个数
 */
- (int)numberOfBarChatView:(LFBarChartView *)barChartView;

@end

@interface LFBarChartView : UIView
    
@property (nonatomic, assign) BOOL isHeaderLabel;
@property (nonatomic, assign) BOOL isbodyLabel;
@property (nonatomic, assign) BOOL isfooterLabel;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) id <LFBarChartViewDelegate> delegate;

@property (nonatomic, assign) id <LFBarChartViewDataSource> dataSource;

- (void)startDrawBarChartView;

@end
