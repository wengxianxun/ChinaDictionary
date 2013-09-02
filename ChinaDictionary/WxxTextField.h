//
//  WxxTextField.h
//  DontTry
//
//  Created by weng xiangxun on 13-1-17.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WxxTextField : UITextField
- (id)initWithPoint:(CGPoint)point image:(NSString *)imgName place:(NSString *)str;
-(void)setOrgXTo0;
@end
