//
//  HZPYData.m
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-5-11.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "HZPYData.h"

@implementation HZPYData

-(void)dealloc{
    [_hzZi release];
    [_hzPy release];
    [_hzBh release];
    [super dealloc];
}
@end
