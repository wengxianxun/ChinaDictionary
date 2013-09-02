//
//  HZData.m
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-5-11.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "HZData.h"

@implementation HZData

-(void)dealloc{
    [_hzBs release];
    [_hzWb release];
    [_hzZi release];
    [_hzBh release];
    [_hzPy release];
    [_hzJj release];
    [_hzXj release];
    [super dealloc];
}
@end
