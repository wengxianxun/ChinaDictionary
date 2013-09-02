//
//  BuShouTableview.h
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-5-18.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <quartzcore/CALayer.h>
#import "BlockUI.h"
@interface BuShouTableview : UITableView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSMutableArray *bihuaArr;
@property (strong,nonatomic)NSIndexPath *selectedCellIndexPath;
@end
