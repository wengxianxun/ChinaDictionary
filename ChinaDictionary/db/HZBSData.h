//
//  HZBSData.h
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-5-11.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZBSData : NSObject
@property (assign,nonatomic)int hzId;
@property (strong,nonatomic)NSString *hzBs; //部首
@property (strong,nonatomic)NSString *hzBh; //比划
@end
