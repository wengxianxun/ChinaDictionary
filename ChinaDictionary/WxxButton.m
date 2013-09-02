//
//  WxxButton.m
//  DontTry
//
//  Created by weng xiangxun on 13-1-17.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "WxxButton.h"
#define TextColor [UIColor whiteColor]
@implementation WxxButton

- (id)initWithPoint:(CGPoint)point image:(NSString *)imgName selectImg:(NSString *)selImg str:(NSString*)str
{
    UIImage *secrectFldpng = [UIImage imageNamed:imgName];
    UIImage *selImgpng = [UIImage imageNamed:selImg];
    self = [super initWithFrame:CGRectMake(point.x, point.y, secrectFldpng.size.width, secrectFldpng.size.height)];
    if (self) {
        // Initialization code
        [self setBackgroundImage:secrectFldpng forState:UIControlStateNormal];
        [self setBackgroundImage:selImgpng forState:UIControlStateSelected];
        [self setTitle:str forState:UIControlStateNormal];
//        self.titleLabel.textColor = TextColor;
        [self addTarget:self action:@selector(touchBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (id)initWithPoint:(CGPoint)point image:(NSString *)imgName selectImg:(NSString *)selImg str:(NSString*)str
              width:(float)widths
{
    
    
    UIImage *secrectFldpng = [UIImage imageNamed:imgName];
    UIImage *selImgpng = [UIImage imageNamed:selImg];
    
    CGFloat top = 10; // 顶端盖高度
    CGFloat bottom = 10 ; // 底端盖高度
    CGFloat left = 10; // 左端盖宽度
    CGFloat right = 10; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 伸缩后重新赋值
    secrectFldpng = [secrectFldpng resizableImageWithCapInsets:insets];
    selImgpng = [selImgpng resizableImageWithCapInsets:insets];
    
    
    self = [super initWithFrame:CGRectMake(point.x, point.y, widths, secrectFldpng.size.height)];
    if (self) {
        // Initialization code
        [self setBackgroundImage:secrectFldpng forState:UIControlStateNormal];
        [self setBackgroundImage:selImgpng forState:UIControlStateSelected];
        [self setTitle:str forState:UIControlStateNormal];
        //        self.titleLabel.textColor = TextColor;
        [self addTarget:self action:@selector(touchBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)hideSeelcted{
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.selected = NO;
}

-(void)touchBtn{
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.selected = YES;
    [self sendObject:@""];
}


- (id)initWithPoint:(CGPoint)point image:(NSString *)imgName place:(NSString *)str
{
    UIImage *secrectFldpng = [UIImage imageNamed:imgName];
    self = [super initWithFrame:CGRectMake(point.x, point.y, secrectFldpng.size.width, secrectFldpng.size.height)];
    if (self) {
        // Initialization code
        [self setBackgroundImage:secrectFldpng forState:UIControlStateNormal];
        [self setTitle:str forState:UIControlStateNormal];
        self.titleLabel.textColor = TextColor;
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
