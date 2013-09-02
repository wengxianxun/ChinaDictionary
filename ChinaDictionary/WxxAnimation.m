//
//  WxxAnimation.m
//  DontTry
//
//  Created by weng xiangxun on 13-1-19.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import "WxxAnimation.h"


@implementation UIViewDelegate
-(id) initWithRunLoop: (CFRunLoopRef)runLoop
{
    if (self = [super init]) currentLoop = runLoop;
    return self;
}
-(void) animationFinished: (id) sender
{
    CFRunLoopStop(currentLoop);
}
@end
@implementation UIView (ModalAnimationHelper)
+ (void) commitModalAnimations
{
    CFRunLoopRef currentLoop = CFRunLoopGetCurrent();
    UIViewDelegate *uivdelegate = [[UIViewDelegate alloc] initWithRunLoop:currentLoop];
    [UIView setAnimationDelegate:uivdelegate];
    [UIView setAnimationDidStopSelector:@selector(animationFinished:)];
    [UIView commitAnimations];
    CFRunLoopRun();
    [uivdelegate release];  
}  
@end