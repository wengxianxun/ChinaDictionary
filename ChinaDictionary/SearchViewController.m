//
//  SearchViewController.m
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-4-27.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "SearchViewController.h"
#import "AboutView.h"
#import "TabrBarView.h"
#import "NavBarView.h"
#import "WxxTextField.h"
#import "WxxButton.h"
#import "BuShouTableview.h"
#import "InfoTableView.h"
#import "SearchView.h"
#import "UMFeedback.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor =[UIColor whiteColor];
        UIImage *img = [UIImage imageNamed:@"navBarBackground.png"];
        
        //**************头部******************************************//
        self.nbview = [[[NavBarView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, img.size.height)] autorelease];
        [self.nbview.titleLB setText:@"汉字"];
        self.nbview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navBarBackground.png"]];
        [self.view addSubview:self.nbview];
//        [nbview release];
        
        //***************搜索筐****************************************
        self.searchV = [[[SearchView alloc]initWithFrame:CGRectMake(0, self.nbview.frame.size.height, 320, 40)] autorelease];
        self.searchV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"location-entry-button-bg-on.png"]];
        [self.view insertSubview:self.searchV belowSubview:self.nbview];
        
        self.wtField = [[[WxxTextField alloc]initWithFrame:CGRectMake(20, 4, 280, 32)] autorelease];
        self.wtField.placeholder = @"汉字搜索";
        self.wtField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.wtField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [self.wtField setBorderStyle:UITextBorderStyleRoundedRect];
        self.wtField.leftView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search.png"]];
        self.wtField.leftView.frame = CGRectMake(0, 0, 25, 25);
        self.wtField.delegate = self;
        self.wtField.leftViewMode = UITextFieldViewModeAlways;
        self.wtField.returnKeyType = UIReturnKeySearch;
        [self.searchV addSubview:self.wtField];
//        [self.searchV release];

        
        //******************tableview*********************************
        self.infoTBView = [[[InfoTableView alloc]initWithFrame:CGRectMake(0,
                                                                                   self.searchV.frame.size.height+self.searchV.frame.origin.y,
                                                                                   self.view.frame.size.width,
                                                                                   self.view.frame.size.height-45-self.searchV.frame.size.height-self.nbview.frame.size.height)] autorelease];
        self.infoTBView.defalutHeight = self.infoTBView.frame.size.height;                               //默认初始化高度
        self.infoTBView.highHeight = self.infoTBView.frame.size.height + self.searchV.frame.size.height; //隐藏searchV的时候，高度变成这个
        self.infoTBView.defalutOrgy = self.infoTBView.frame.origin.y;   //默认top距离
        self.infoTBView.highOrgy = self.searchV.frame.origin.y;         //隐藏searchV的时候，top距离变成这个
        [self.view addSubview:self.infoTBView];
        
        /*****************部首table************************************
         *   切换到部首tab的时候，显示本table列
         */
        if (!self.BushouView) { //部首外部要包含一个view，用来做边框线，
            self.BushouView = [[[UIView alloc]initWithFrame:CGRectMake(-90,
                                                                      self.nbview.frame.origin.y+self.nbview.frame.size.height,
                                                                      90,
                                                                      self.infoTBView.highHeight)] autorelease];
            self.BushouView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navBarBackground.png"]];
            [self.view addSubview:self.BushouView];
        }
        if (!self.buShowTBView) {//部首table
            self.buShowTBView = [[[BuShouTableview alloc]initWithFrame:CGRectMake(0,
                                                                                  2,
                                                                                  88,
                                                                                  self.infoTBView.highHeight)] autorelease];
            
            [self.buShowTBView receiveObject:^(id object) {
                HZBSData *hzbd = (HZBSData*)object;
                //选择笔画
                NSMutableArray *arr = [[PenSoundDao sharedPenSoundDao]selectHZBSALL:hzbd.hzBh]; // 根据部首笔画查询部首
                [self.infoTBView showInfo:arr];
            }];
            [self.BushouView addSubview:self.buShowTBView];
        }
        
        

        //******************底部*************************************
        TabrBarView *tbview = [[TabrBarView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-49,
                                                                           self.view.frame.size.width, 49)];
        [self.view addSubview:tbview];
        [self.view bringSubviewToFront:tbview];
        
        //*************返回按钮**************************************
        self.backBtn = [[WxxButton alloc]initWithPoint:CGPointMake(0, self.view.frame.size.height) image:@"navBarBackground.png" selectImg:@"navBarBackground.png" str:@"返回" width:self.view.frame.size.width];
        [self.view addSubview:self.backBtn];
        
        [self.backBtn receiveObject:^(id object) {
            if (tbbENUM == krightEnum) {
                [self initBushouTableview];
            }
            [self.infoTBView hideCell];
            
        }];
        
        //*********底部tabbar的动态************
        [tbview receiveObject:^(id object) {
            
            tbbENUM = [object intValue];
            self.wtField.text = @"";
            [self.infoTBView showInfo:nil];
            switch (tbbENUM) {
                case kleftEnum:
                    NSLog(@"kleftEnum");
                    [self.nbview.titleLB setText:@"汉字"];
                    self.wtField.placeholder = @"汉字搜索";
                    [self hideBushoutableview];
                    break;
                case kmillEnum:
                    [self.nbview.titleLB setText:@"拼音"];
                    self.wtField.placeholder = @"拼音搜索";
                    [self hideBushoutableview];
//                    [BlackView orgYAnimation:self.searchV orgY:self.nbview.frame.size.height duration:0.5];
                    break;
                case krightEnum:
                    [self.nbview.titleLB setText:@"部首"];
                    self.wtField.placeholder = @"部首搜索";
                    //tableview变长
//                    [self.infoTBView showTableView];
                    
//                    [UIView animateWithDuration:0.5 animations:^{
//                        CGRect detailRect = self.searchV.frame;
//                        detailRect.origin.y = 0;
//                        [self.searchV setFrame:detailRect];
//                        
//                        CGRect ifdetailRect = self.infoTBView.frame;
//                        ifdetailRect.origin.y = self.infoTBView.highOrgy;
//                        ifdetailRect.size.height = self.infoTBView.highHeight;
//                        [self.infoTBView setFrame:ifdetailRect];
//                        
////                         [BlackView sizeHeightAnimation:self.infoTBView sizeH:self.infoTBView.highHeight];
//                    }completion:^(BOOL finished) {
//                        
////                        [BlackView orgXAnimation:self.buShowTBView orgx:0];
////                        [BlackView orgXAnimation:self.infoTBView orgx:self.buShowTBView.frame.size.width duration:0.7];
////                        self.infoTBView.scrollEnabled = YES;
//                    }];

                    
                   
                    
                    [self initBushouTableview];//显示部首比划table
                    break;
                default:
                    break;
            }
        }];
        
        //tableview列表的动态
        [self.infoTBView receiveObject:^(id object) {
            
            switch ([object intValue]) {
                case kHideSearchVEnum:
                    //tableview变长
//                    [self.infoTBView showTableView];
                    //隐藏搜索筐
                    [BlackView orgYAnimation:self.searchV orgY:0 duration:0.5];
                    //隐藏底部tabbar,显示底部返回按钮
                    [BlackView orgYAnimation:tbview orgY:self.view.frame.size.height duration:0.5];
                    [BlackView orgYAnimation:self.backBtn orgY:self.view.frame.size.height-44 duration:0.5];
                    [BlackView orgXAnimation:self.infoTBView orgx:0 duration:0.5];//table回归位置
                    [BlackView orgXAnimation:self.BushouView orgx:-90];//部首table隐藏
                    break;
                case kShowSearchVEnum:
                    
                    if (tbbENUM != krightEnum) {
                        //table变短
                        [self.infoTBView hideTableView];
                        //显示搜索筐(在部首模式下不显示)
                        [BlackView orgYAnimation:self.searchV orgY:self.nbview.frame.size.height duration:0.5];
                    }
                    //隐藏底部tabbar,显示底部返回按钮
                    [BlackView orgYAnimation:tbview orgY:self.view.frame.size.height-49 duration:0.5];
                    [BlackView orgYAnimation:self.backBtn orgY:self.view.frame.size.height duration:0.5];
                    break;
                default:
                    break;
            }
        }];
        
        
        [self.nbview receiveObject:^(id object) {

            UIWindow *topWindow = [[UIApplication sharedApplication] keyWindow];
            
            [UMFeedback showFeedback:topWindow.rootViewController withAppkey:@"517a258256240b8c1f00758a"];
//            AboutView *abv = [[AboutView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//            [self.view addSubview:abv];
        }];
    }
    return self;
}

-(void)hideSearhV{
    
}

-(void)hideBushoutableview{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [BlackView orgXAnimation:self.infoTBView orgx:0 duration:0.5];//table回归位置
        [BlackView orgXAnimation:self.BushouView orgx:-90];//部首table隐藏
        self.infoTBView.scrollEnabled = YES;
        
        //                         [BlackView sizeHeightAnimation:self.infoTBView sizeH:self.infoTBView.highHeight];
    }completion:^(BOOL finished) {
       
        [UIView animateWithDuration:0.5 animations:^{
            CGRect detailRect = self.searchV.frame;
            detailRect.origin.y = self.nbview.frame.size.height;
            [self.searchV setFrame:detailRect];
            
            CGRect ifdetailRect = self.infoTBView.frame;
            ifdetailRect.origin.y = self.infoTBView.defalutOrgy;
            ifdetailRect.size.height = self.infoTBView.defalutHeight;
            [self.infoTBView setFrame:ifdetailRect];
        }];
    }];
}

-(void)initBushouTableview{
   
    [UIView animateWithDuration:0.5 animations:^{
        CGRect detailRect = self.searchV.frame;
        detailRect.origin.y = 0;
        [self.searchV setFrame:detailRect];
        
        CGRect ifdetailRect = self.infoTBView.frame;
        ifdetailRect.origin.y = self.infoTBView.highOrgy;
        ifdetailRect.size.height = self.infoTBView.highHeight;
        [self.infoTBView setFrame:ifdetailRect];
        
        //                         [BlackView sizeHeightAnimation:self.infoTBView sizeH:self.infoTBView.highHeight];
    }completion:^(BOOL finished) {
        
                                [BlackView orgXAnimation:self.BushouView orgx:0];
                                [BlackView orgXAnimation:self.infoTBView orgx:self.BushouView.frame.size.width duration:0.7];
                                self.infoTBView.scrollEnabled = YES;
    }];

    
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
        if (buttonIndex == 0) {     // and they clicked OK.
            // do stuff
            NSString *number = @"13023837245";// 此处读入电话号码
             NSString *num = [[NSString alloc] initWithFormat:@"tel://%@",number]; //number为号码字符串 如果使用这个方法 结束电话之后会进入联系人列表
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号
        }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.wtField resignFirstResponder];
    
    NSString *texf = textField.text;
//    NSLog(@"%@",texf);
    if (!texf || [texf length]<=0) {
        return false;
    }
    
    if ([texf isEqualToString:@"陈丽蓉"]) {
        UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"hi" message:@"丽蓉，I like you，Can you be my girlfriend?" delegate:self cancelButtonTitle:@"开心答应" otherButtonTitles:@"残忍拒绝", nil];
        [al show];
        [al release];
    }
    
    if (tbbENUM == kmillEnum) {//拼音
        NSMutableArray *arr = [[PenSoundDao sharedPenSoundDao]selectHZPY4py:[textField.text uppercaseString]];
        [self.infoTBView showInfo:arr];
    }else if (tbbENUM == kleftEnum) {//汉字
        NSMutableArray *arr = [[PenSoundDao sharedPenSoundDao]selectHZPY4Zi:textField.text];
        [self.infoTBView showInfo:arr];
    }else if (tbbENUM == krightEnum) {//部首
        NSMutableArray *arr = [[PenSoundDao sharedPenSoundDao]selectHZBSALL:@"2"]; // 根据部首笔画查询部首
        [self.infoTBView showInfo:arr];
    }
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
//    [_dictionary release];
    [_wtField release];
    [_backBtn release];
    [_wtField release];
    [_nbview release];
    [_searchV release];
    [_infoTBView release];
    [_buShowTBView release];
    [super dealloc];
}
@end
