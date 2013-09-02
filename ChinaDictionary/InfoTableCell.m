//
//  InfoTableCell.m
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-5-4.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "InfoTableCell.h"
#import "WxxLabel.h"
//#import "InfoTextView.h"
@implementation InfoTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.titleLB = [[[WxxLabel alloc]initWithFrame:CGRectMake(30, 0, UIBounds.size.width, 30)] autorelease];
        self.titleLB.textColor = TextColor;
        [self.contentView addSubview:self.titleLB];
        
        if (!self.infoTView) {
            self.infoTView = [[[InfoTextView alloc]initWithFrame:CGRectMake(0, self.titleLB.frame.origin.y+self.titleLB.frame.size.height, UIBounds.size.width, 0)] autorelease];
            self.infoTView.textColor = TextColor;
            [self.contentView addSubview:self.infoTView];
        }
    }
    return self;
}

-(void)showInfoView:(float)height{

    HZData *hzData = [[PenSoundDao sharedPenSoundDao]selectHZ4hz:self.ziStr];
    NSString*b =[hzData.hzJj stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    NSString *b2 =  [hzData.hzXj stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
   [self.infoTView setText:[NSString stringWithFormat:@"%@ \n %@",b,b2]];

    
    [BlackView sizeHeightAnimation:self.infoTView sizeH:height-self.titleLB.frame.size.height];

}

-(void)hideInfoView{
    [BlackView sizeHeightAnimation:self.infoTView sizeH:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)dealloc{
    [_titleLB release];
    [_infoTView release];
    [super dealloc];
}
@end
