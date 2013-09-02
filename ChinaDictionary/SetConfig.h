//
//  SetConfig.h
//  DontTry
//
//  Created by weng xiangxun on 13-1-15.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DBNAME @"db.sqlite"
#define LOGTYPE @"LOGINTYPEENUM"
#define ShowLocali(str) NSLocalizedString(str,nil)
#define enumToObj(enum) [NSNumber numberWithInt:enum]
#define UIBounds [[UIScreen mainScreen] bounds]
#define BackColor [UIColor whiteColor]
#define TextColor [UIColor colorWithRed:56/255.0 green:141/255.0 blue:168/255.0 alpha:1.0]

#define TextblueColor [UIColor blueColor]


#pragma mark - View  - prefix: KY

// App View Basic
#define kKYViewHeight CGRectGetHeight([UIScreen mainScreen].applicationFrame)
#define kKYViewWidth  CGRectGetWidth([UIScreen mainScreen].applicationFrame)

// Button Size
#define kKYButtonInMiniSize   16.f
#define kKYButtonInSmallSize  32.f
#define kKYButtonInNormalSize 35.f

//#define kLEFT @"left"
//#define kMILL @"mill"
//#define kRIGHT @"right"
//#define kHideSearchV = @"hidesearchv"

typedef enum {
    kleftEnum, //左边按钮
    kmillEnum, //中间按钮
    krightEnum,//右边按钮
}tabbarEnum;

typedef enum {
    
    kHideSearchVEnum, //隐藏搜索框
    kShowSearchVEnum, //显示搜索框
}kTYPEENUM;


