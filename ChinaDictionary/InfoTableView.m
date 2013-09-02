//
//  InfoTableView.m
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-5-4.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "InfoTableView.h"
#import "InfoTableCell.h"
@implementation InfoTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        self.backgroundColor = [UIColor yellowColor];
        self.delegate = self;
        self.dataSource = self;
        self.selectedCellIndexPath = [NSIndexPath indexPathForRow:-1 inSection:0];
//        [self setSeparatorColor:TextColor];
//        self.layer.borderColor = [[UIColor colorWithRed:56/255.0 green:141/255.0 blue:168/255.0 alpha:1.0] CGColor];
//        self.layer.borderWidth = 1;
//        [self initPlayer];
    }
    return self;
}
-(void)initPlayer{
    if (self.palyer) {
        [self.palyer release];
    }
    NSString *soundPath=[[NSBundle mainBundle] pathForResource:@"metallic 1" ofType:@"wav"];
    NSURL *soundUrl=[[NSURL alloc] initFileURLWithPath:soundPath];
    self.palyer=[[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [self.palyer prepareToPlay];
    [soundUrl release];
}
-(void)showInfo:(NSMutableArray *)dic{
    if (self.infoArr) {
        [self.infoArr removeAllObjects];
        [self.infoArr release];
//        self.infoArr = nil;
    }
    self.infoArr = [dic retain];
    if ([self.infoArr count]>0) {
//        [self.palyer play];
    }
    [self reloadData];
//    [self setContentOffset:CGPointMake(0, 80)];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.infoArr count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.selectedCellIndexPath != nil
       && [self.selectedCellIndexPath compare:indexPath] == NSOrderedSame){
        return self.highHeight;
    }
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cate_cell";
    
    InfoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[[InfoTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                 reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell receiveObject:^(id object) {
        }];//block结束
    }

    HZPYData *hzpyData = [self.infoArr objectAtIndex:indexPath.row];

    cell.ziStr = hzpyData.hzZi;
    //update prclst set p_prd=replace(p_prd,'-','') 
//    NSLog(@"%@",hzData.hzJj);
    
    [cell hideInfoView];
    [cell.titleLB setText:hzpyData.hzZi];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    //    NSLog(@"%d---%d",self.selectedCellIndexPath.row,indexPath.row);
    InfoTableCell * cell;
    cell = (InfoTableCell*)[tableView cellForRowAtIndexPath:self.selectedCellIndexPath];
    NSLog(@"%d ----  %d",indexPath.row,  self.selectedCellIndexPath.row);
    //    [self showEdit];
    //点击行和当前显示子类行是同一行
    if (self.selectedCellIndexPath.row==indexPath.row) {
        
        //把点击行设置为－1， 那么刷新行高的时候，就会把点击行刷新为默认行高
        self.selectedCellIndexPath = [NSIndexPath indexPathForRow:-1 inSection:0];
        
        if (self.scrollEnabled) {
            ynDefault = NO;
            self.scrollEnabled = YES;
            
            //*********************刷新选中行*******************************//
            [self beginUpdates];
            [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated: YES];
            [self endUpdates];
            [self sendObject:enumToObj(kShowSearchVEnum)];
//            [self hideTableView];
            [cell hideInfoView];
        }
    }else{
        
        //点击行
        self.selectedCellIndexPath = indexPath;
        
        if (self.scrollEnabled) {
            
//            [self deselectRowAtIndexPath:indexPath animated:NO];
            
            InfoTableCell * cell;
            if (ynDefault)
            {
                ynDefault = NO;
                cell = (InfoTableCell*)[tableView cellForRowAtIndexPath:self.selectedCellIndexPath];
                self.scrollEnabled = YES;
                
            }
            else
            {
                ynDefault = YES;
                self.selectedCellIndexPath = indexPath;
                cell = (InfoTableCell*)[tableView cellForRowAtIndexPath:indexPath];
            }
            [self sendObject:enumToObj(kHideSearchVEnum)];
            [self showTableView];
            
            [cell showInfoView:self.highHeight];
            //*********************刷新选中行*******************************//
            [self beginUpdates];
//            [self scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
            [self scrollToRowAtIndexPath:self.selectedCellIndexPath atScrollPosition:UITableViewScrollPositionNone animated: YES];
            [self endUpdates];
            
            NSLog(@"位置:%d",self.selectedCellIndexPath.row*40);
            NSLog(@"高度%f",self.frame.origin.x);
            [self setContentOffset:CGPointMake(0, self.selectedCellIndexPath.row*40)];
            
        }
    }
}

-(void)hideCell{
    //把点击行设置为－1， 那么刷新行高的时候，就会把点击行刷新为默认行高
   
    InfoTableCell * cell;
    cell = (InfoTableCell*)[self cellForRowAtIndexPath:self.selectedCellIndexPath];
    NSIndexPath *nip = [self.selectedCellIndexPath copy];
    self.selectedCellIndexPath = [NSIndexPath indexPathForRow:-1 inSection:0];
    
    
        ynDefault = NO;
        self.scrollEnabled = YES;
        
        //*********************刷新选中行*******************************//
        [self beginUpdates];
        [self scrollToRowAtIndexPath:nip atScrollPosition:UITableViewScrollPositionTop animated: YES];
        [self endUpdates];
        [self sendObject:enumToObj(kShowSearchVEnum)];
        //            [self hideTableView];
        [cell hideInfoView];
    
}

//搜索框隐藏，table高度加高，向上移动
-(void)showTableView{
    self.scrollEnabled = NO;
    [UIView animateWithDuration:0.5 animations:^{
        CGRect detailRect = self.frame;
        detailRect.origin.y = self.highOrgy;
        [self setFrame:detailRect];
        [BlackView sizeHeightAnimation:self sizeH:self.highHeight];
    }completion:^(BOOL finished) {
        
//        [BlackView orgYAnimation:self orgY:self.highOrgy duration:0.5];
    }];
    
    
}
//反之
-(void)hideTableView{
    self.scrollEnabled = YES;
    [UIView animateWithDuration:0.5 animations:^{
        CGRect detailRect = self.frame;
        detailRect.origin.y = self.defalutOrgy;
        [self setFrame:detailRect];
    }completion:^(BOOL finished) {
        [BlackView sizeHeightAnimation:self sizeH:self.defalutHeight];
        //        [BlackView orgYAnimation:self orgY:self.highOrgy duration:0.5];
    }];
    
//    [BlackView sizeHeightAnimation:self sizeH:self.defalutHeight];
//    [BlackView orgYAnimation:self orgY:self.defalutOrgy duration:0.5];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)dealloc{
    if (_infoArr) {
            [_infoArr release];
    }
    if (_selectedCellIndexPath) {
        [_selectedCellIndexPath release];
    }
    [super dealloc];
}

@end
