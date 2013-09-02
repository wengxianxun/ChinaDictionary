//
//  WxxAnimation.h
//  DontTry
//
//  Created by weng xiangxun on 13-1-19.
//  Copyright (c) 2013年 weng xiangxun. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (ModalAnimationHelper)
+ (void) commitModalAnimations;
@end
@interface UIViewDelegate : NSObject
{
    CFRunLoopRef currentLoop;
}
@end
