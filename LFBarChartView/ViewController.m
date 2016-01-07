//
//  ViewController.m
//  LFBarChartView
//
//  Created by prudent on 14/11/16.
//  Copyright (c) 2014年 prudent. All rights reserved.
//

#import "ViewController.h"
#import "LFBarChartView.h"
#import "LFBarChartOne.h"

@interface ViewController ()<LFBarChartViewDataSource, LFBarChartViewDelegate>
{
    NSMutableArray *_chartArray;
}
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [[NSMutableArray alloc] init];
    
    [self makeRequest];
    
    LFBarChartView *barChartView = [[LFBarChartView alloc] initWithFrame:CGRectMake(100, 300, 615, 160)];
    barChartView.dataArray = self.dataArray;
    barChartView.delegate = self;
    barChartView.dataSource = self;
//    barChartView.backgroundColor = [UIColor redColor];
    [self.view addSubview:barChartView];
    [barChartView startDrawBarChartView];
    
    [self setUpHightLightChartView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setUpHightLightChartView
{
    LFBarChartOne *barChart = _chartArray[3];
    barChart.maxView.backgroundColor = [UIColor blackColor];
}

- (void)makeRequest
{
    NSArray *heightArray = @[@"139", @"169", @"618", @"139", @"169", @"618", @"139", @"169", @"618", @"139", @"169", @"618"];
    NSArray *cityNameArray = @[@"Chengdu", @"Shanghai", @"Beijing", @"Chengdu", @"Shanghai", @"Beijing", @"Chengdu", @"Shanghai", @"Beijing", @"Chengdu", @"Shanghai", @"Beijing"];
    
    [self.dataArray addObject:heightArray];
    [self.dataArray addObject:cityNameArray];
}

#pragma mark dataSource代理
- (int)numberOfBarChatView:(LFBarChartView *)brokenLineView
{
    return 12;
}

#pragma mark delegate代理
- (BOOL)isNeedHeaderLabel:(UILabel *)headerLabel
{
    return YES;
}

- (BOOL)isNeedBodyLabel:(UILabel *)bodyLabel
{
    return YES;
}

- (BOOL)isneedFooterLabel:(UILabel *)footerLabel
{
    return YES;
}

- (BOOL)isNeedClick
{
    return YES;
}

- (float)barChartViewWithgap:(LFBarChartView *)barChartView
{
    return 15.5;
}

- (float)heightOfBarChatView:(LFBarChartView *)barChartView
{
    return 5;
}

- (void)getAllBarChartView:(NSMutableArray *)chartArray
{
    _chartArray = chartArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
