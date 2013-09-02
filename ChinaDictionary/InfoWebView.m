//
//  InfoWebView.m
//  ChinaDictionary
//
//  Created by weng xiangxun on 13-5-15.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "InfoWebView.h"

@implementation InfoWebView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}
-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    //NSString *shouldOpen = webView.request.URL.absoluteString;
    
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
