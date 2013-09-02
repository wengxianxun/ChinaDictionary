//
//  AboutView.m
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-6-1.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "AboutView.h"
#import "WxxButton.h"
@implementation AboutView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        WxxLabel *wxxlb = [[WxxLabel alloc]initWithFrame:CGRectMake(0, 200, 320, 50)];
        wxxlb.text = @"联系方式:505783958@qq.com";
        [self addSubview:wxxlb];
        [wxxlb release];
        self.backgroundColor = [UIColor whiteColor];
        
        WxxButton *wxxBtn = [[WxxButton alloc]initWithPoint:CGPointMake(7, 7) image:@"navbar-button" selectImg:@"navbar-button" str:@"<"];
        [wxxBtn addTarget:self action:@selector(closeSelf) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:wxxBtn];
        [wxxBtn release];
    }
    return self;
}

-(void)closeSelf{
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
