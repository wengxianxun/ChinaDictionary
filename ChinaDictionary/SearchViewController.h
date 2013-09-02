//
//  SearchViewController.h
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-4-27.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockUI.h"
@class WxxTextField;
@class InfoTableView;
@class WxxButton;
@class BuShouTableview;
@class SearchView;
@class NavBarView;
@interface SearchViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
{
    tabbarEnum tbbENUM;//当前点击的是哪个tab
}
@property (strong,nonatomic)BuShouTableview *buShowTBView; //部首table
@property (strong,nonatomic)UIView *BushouView; //部首背景view
@property (strong,nonatomic)SearchView *searchV;
@property (strong,nonatomic)NavBarView *nbview;
@property (strong,nonatomic)WxxButton *backBtn;//退出cell展开状态
@property (strong,nonatomic)WxxTextField *wtField;//输入框
@property (strong,nonatomic)InfoTableView *infoTBView; //tableview
//@property (strong,nonatomic)NSDictionary *dictionary; //字典
//@property (strong,nonatomic)NSDictionary *basicDic; //汉字解释
//@property (strong,nonatomic)NSDictionary *pinyinDic;  //拼音汉字对应的拼音声母 PinyinForCharacter.plist
@end
