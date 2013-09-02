//
//  InfoTableCell.h
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-5-4.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoTextView.h"
#import "InfoWebView.h"
@interface InfoTableCell : UITableViewCell
@property (strong,nonatomic) UILabel* titleLB;
@property (strong,nonatomic) NSString *ziStr;//当前行d字
@property (strong,nonatomic) InfoTextView *infoTView;
//@property (strong,nonatomic) InfoWebView *infoWebView;
-(void)showInfoView:(float)height;
-(void)hideInfoView;
@end
