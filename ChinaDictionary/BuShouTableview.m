//
//  BuShouTableview.m
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-5-18.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "BuShouTableview.h"
#import "InfoTableCell.h"
@implementation BuShouTableview

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.delegate = self;
        self.dataSource = self;
        self.bihuaArr = [[PenSoundDao sharedPenSoundDao]selectHZBSBIHUA];
        self.indicatorStyle=UIScrollViewIndicatorStyleBlack;
        [self setShowsHorizontalScrollIndicator:YES];
//        UIView *leftlinev = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width-2, 0, 3, 40*[self.bihuaArr count])];
//        leftlinev.backgroundColor = [UIColor colorWithRed:56/255.0 green:141/255.0 blue:168/255.0 alpha:1.0];
//        [self addSubview:leftlinev];
//        [leftlinev release];
//        
//        UIView *toplinev = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 2)];
//        toplinev.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navBarBackground.png"]];
//        [self addSubview:toplinev];
//        [toplinev release];
//        self.layer
//        self.layer.borderColor = [[UIColor colorWithRed:56/255.0 green:141/255.0 blue:168/255.0 alpha:1.0] CGColor];
//        self.layer.borderWidth = 1.5;
//        self.layer.shadowColor = [[UIColor blackColor] CGColor];
//        self.layer.shadowOffset = CGSizeMake(11.0f, 11.0f); // [水平偏移, 垂直偏移]
//        self.layer.shadowOpacity = 0.5f; // 0.0 ~ 1.0 的值
//        self.layer.shadowRadius = 10.0f; // 陰影發散的程度
        
//        CAGradientLayer *gradient = [CAGradientLayer layer];
//        gradient.frame = self.bounds;
//        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor red] CGColor], (id)[[UIColor grayColor] CGColor], nil]; // 由上到下的漸層顏色
//        [self.layer insertSublayer:gradient atIndex:0];
    }
    return self;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.bihuaArr count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cate_cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
//        [cell receiveObject:^(id object) {
//        }];//block结束
    }
    HZBSData *hzbs = [self.bihuaArr objectAtIndex:indexPath.row];
    
   cell.textLabel.text = [NSString stringWithFormat:@"%@画",hzbs.hzBh];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *preCell = [self cellForRowAtIndexPath:self.selectedCellIndexPath];
    preCell.backgroundColor = [UIColor whiteColor];
    
    self.selectedCellIndexPath = indexPath;
    
    UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navBarBackground.png"]];
    HZBSData *hzbs = [self.bihuaArr objectAtIndex:indexPath.row];
    NSLog(@"%@",hzbs.hzBh);
    [self sendObject:hzbs];
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
    [_bihuaArr release];
    [super dealloc];
}

@end
