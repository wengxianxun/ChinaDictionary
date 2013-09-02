//
//  HZBSData.m
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-5-11.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "HZBSData.h"

@implementation HZBSData
-(void)dealloc{
    [_hzBs release];
    [_hzBh release];
    [super dealloc];
}
@end
