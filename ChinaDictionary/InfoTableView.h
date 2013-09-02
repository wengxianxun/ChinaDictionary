//
//  InfoTableView.h
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-5-4.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockUI.h"
#import <AVFoundation/AVFoundation.h>
@interface InfoTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
{
BOOL ynDefault;
}
@property (nonatomic,strong)    AVAudioPlayer *palyer;
@property (assign,nonatomic)float defalutHeight;
@property (assign,nonatomic)float highHeight;
@property (assign,nonatomic)float defalutOrgy;
@property (assign,nonatomic)float highOrgy;

@property (strong,nonatomic)NSIndexPath *selectedCellIndexPath;
@property (strong,nonatomic)NSMutableArray *infoArr; //查询出的cell列title


-(void)hideCell;
-(void)showInfo:(NSMutableArray*)dic;
-(void)showTableView;
-(void)hideTableView;
@end
