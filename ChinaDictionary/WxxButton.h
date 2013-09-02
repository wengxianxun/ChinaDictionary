//
//  WxxButton.h
//  DontTry
//
//  Created by weng xiangxun on 13-1-17.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockUI.h"
@interface WxxButton : UIButton
- (id)initWithPoint:(CGPoint)point image:(NSString *)imgName selectImg:(NSString *)selImg str:(NSString*)str;
- (id)initWithPoint:(CGPoint)point image:(NSString *)imgName selectImg:(NSString *)selImg str:(NSString*)str
              width:(float)widths;
-(void)setOrgXTo0;
- (id)initWithPoint:(CGPoint)point image:(NSString *)imgName;
-(void)hideSeelcted;
@end
