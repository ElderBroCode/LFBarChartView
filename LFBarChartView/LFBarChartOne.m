//
//  LFBarChartOne.m
//  LFBarChartView
//
//  Created by prudent on 14/11/16.
//  Copyright (c) 2014年 prudent. All rights reserved.
//

#import "LFBarChartOne.h"

@interface LFBarChartOne ()

@end
@implementation LFBarChartOne

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIButton *maxView = [[UIButton alloc] init];
        maxView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        maxView.tag = 0;
        self.maxView = maxView;
        maxView.backgroundColor = [UIColor colorWithRed:188/255.0 green:215/255.0 blue:250/255.0 alpha:1];
        [self addSubview:maxView];
        
        UILabel *numberLabel = [[UILabel alloc] init];
        self.numberLabel = numberLabel;
        numberLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:numberLabel];
        
        UILabel *numLabel = [[UILabel alloc] init];
        self.numLabel = numLabel;
        numLabel.numberOfLines = 0;
        numLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:numLabel];
        
        UILabel *cityLabel = [[UILabel alloc] init];
        self.cityLabel = cityLabel;
        cityLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:cityLabel];
        
        CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2 *2);
        self.numLabel.transform = transform;
        self.cityLabel.transform = transform;
        self.numberLabel.transform = transform;
        
        numberLabel.textAlignment = NSTextAlignmentCenter;
        cityLabel.textAlignment = NSTextAlignmentCenter;
        
        numberLabel.frame = CGRectMake(-5, 0, self.frame.size.width +10, 20);
        
        cityLabel.frame = CGRectMake(-5, self.frame.size.height-20, self.frame.size.width +10, 20);
        
        numLabel.textAlignment = NSTextAlignmentCenter;
        numLabel.frame = CGRectMake(-5, 0, self.frame.size.width +10, 20);
    }
    return self;
}



- (void)setMaxHeight:(CGFloat)maxHeight
{
    _maxHeight = maxHeight;
    [UIView animateWithDuration:1.35 animations:^{
        CGRect frame = self.numLabel.frame;
        frame.origin.y = maxHeight;
        self.numLabel.frame = frame;
        
        CGRect frame1 = self.maxView.frame;
        frame1.size.height = maxHeight;
        self.maxView.frame = frame1;
        
        CGRect frame2 = self.numberLabel.frame;
        frame2.size.height = maxHeight;
        self.numberLabel.frame = frame2;
    }];
}

@end
