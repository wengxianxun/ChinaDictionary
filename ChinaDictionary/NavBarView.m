//
//  NavBarView.m
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-4-27.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "NavBarView.h"
#import "WxxLabel.h"
#import "WxxButton.h"
@implementation NavBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.titleLB = [[[WxxLabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)] autorelease];
        self.titleLB.backgroundColor = [UIColor clearColor];
        self.titleLB.font = [UIFont systemFontOfSize:25];
        self.titleLB.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLB];
        self.titleLB.textColor = [UIColor whiteColor];
        
        WxxButton *wxxBtn = [[WxxButton alloc]initWithPoint:CGPointMake(7, 7) image:@"navbar-button" selectImg:@"navbar-button" str:@"i"];
        [wxxBtn addTarget:self action:@selector(showAbout) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:wxxBtn];
        [wxxBtn release];
    }
    return self;
}

-(void)showAbout{
    [self sendObject:@""];
}

-(void)dealloc{
    [_titleLB release];
    [super dealloc];
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
