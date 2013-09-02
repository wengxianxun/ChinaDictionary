//
//  TabrBarView.m
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-4-27.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "TabrBarView.h"
#import "WxxButton.h"
@implementation TabrBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initPlayer];
        // Initialization code
//        UIImage *image = [UIImage imageNamed:@"tab-bar-search-bg-off"];
        WxxButton *leftBtn = [[WxxButton alloc]initWithPoint:CGPointMake(0, 0)
                                                       image:@"tab-bar-search-bg-off"
                                                   selectImg:@"tab-bar-search-bg-on"
                                                         str:@"汉字"];
        WxxButton *millBtn = [[WxxButton alloc]initWithPoint:CGPointMake(leftBtn.frame.size.width, 0)
                                                       image:@"tab-bar-me-bg-off"
                                                   selectImg:@"tab-bar-me-bg-on"
                                                         str:@"拼音"];
//        [millBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
        WxxButton *rightBtn = [[WxxButton alloc]initWithPoint:CGPointMake(millBtn.frame.size.width+millBtn.frame.origin.x, 0)
                                                        image:@"tab-bar-add-bg-off"
                                                    selectImg:@"tab-bar-add-bg-on"
                                                          str:@"部首"];
//        [rightBtn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        
        leftBtn.selected = YES;
        [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [leftBtn receiveObject:^(id object) {
            [millBtn hideSeelcted];
            [rightBtn hideSeelcted];
            [self.palyer play];
            [self sendObject:enumToObj(kleftEnum)];
        }];
        [millBtn receiveObject:^(id object) {
            [leftBtn hideSeelcted];
            [rightBtn hideSeelcted];
                        [self.palyer play];
            [self sendObject:enumToObj(kmillEnum)];
        }];
        [rightBtn receiveObject:^(id object) {
            [millBtn hideSeelcted];
            [leftBtn hideSeelcted];
                        [self.palyer play];
            [self sendObject:enumToObj(krightEnum)];
        }];
        
        [self addSubview:rightBtn];
        [self addSubview:leftBtn];
        [self addSubview:millBtn];
    }
    return self;
}

-(void)initPlayer{
    if (self.palyer) {
        [self.palyer release];
    }
    NSString *soundPath=[[NSBundle mainBundle] pathForResource:@"blip8" ofType:@"wav"];
    NSURL *soundUrl=[[NSURL alloc] initFileURLWithPath:soundPath];
    self.palyer=[[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [self.palyer prepareToPlay];
    [soundUrl release];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
