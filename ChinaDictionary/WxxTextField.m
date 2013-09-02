//
//  WxxTextField.m
//  DontTry
//
//  Created by weng xiangxun on 13-1-17.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "WxxTextField.h"

@implementation WxxTextField

- (id)initWithPoint:(CGPoint)point image:(NSString *)imgName place:(NSString *)str
{
    UIImage *secrectFldpng = [UIImage imageNamed:imgName];
    self = [super initWithFrame:CGRectMake(point.x, point.y, secrectFldpng.size.width, secrectFldpng.size.height)];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithPatternImage:secrectFldpng];
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.leftView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search.png"]];
        self.leftViewMode = UITextFieldViewModeAlways;
        self.placeholder = str;
//        self.textColor = _textColor;
    }
    return self;
}
-(void)setOrgXTo0{
    self.frame = CGRectMake(self.frame.origin.x-self.frame.size.width, self.frame.origin.y,
                            self.frame.size.width, self.frame.size.height);
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
