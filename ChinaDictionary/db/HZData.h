//
//  HZData.h
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-5-11.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZData : NSObject
@property (assign,nonatomic)int hzId;
@property (strong,nonatomic)NSString *hzZi; //字
@property (strong,nonatomic)NSString *hzWb; //五笔

@property (strong,nonatomic)NSString *hzBs; //部首
@property (strong,nonatomic)NSString *hzBh; //比划
@property (strong,nonatomic)NSString *hzPy; //拼音
@property (strong,nonatomic)NSString *hzJj; //讲解
@property (strong,nonatomic)NSString *hzXj; //详解
@end
