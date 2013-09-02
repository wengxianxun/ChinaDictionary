//
//  BlackView.m
//  MIMIGOU
//
//  Created by xiangxun weng on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BlackView.h" 
#import <QuartzCore/QuartzCore.h>
@implementation BlackView 

static BlackView *_sharedBlackView = nil;

/**
 */
+ (BlackView *)sharedBlackView
{
	if (!_sharedBlackView) {
		_sharedBlackView = [[[self alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)] autorelease];
	}
    _sharedBlackView.alpha = 0.9;
	_sharedBlackView.hidden = NO;
	return _sharedBlackView;
}
   
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.9;
    }
    return self;
}

+(void)alphaAnimation:(UIView *)v  orgx:(float)orgx  duration:(float)dur{
    
    v.alpha = 0.0;
    [UIView animateWithDuration:dur animations:^{
         v.alpha = orgx;
    }];
//    [UIView beginAnimations:@"AppDetail" context:NULL];
//    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//    [UIView setAnimationDuration:dur];
//    v.alpha = orgx;
//    [UIView commitAnimations];
    
}

+(void)layerAlpha:(UIView*)v{
     
    [UIView animateWithDuration:2.5 animations:^{
        v.layer.borderWidth = 3;
        v.layer.borderColor = [[UIColor colorWithRed:0.52 green:0.09 blue:0.07 alpha:0.0] CGColor];
    }];
//    // 准备动画
//    CATransition *animation = [CATransition animation];
//    
//    //动画播放持续时间
//    [animation setDuration:3.0f];
//    
//    /*动画速度,何时快、慢
//     (
//     kCAMediaTimingFunctionLinear 线性（匀速）|
//     kCAMediaTimingFunctionEaseIn 先慢|
//     kCAMediaTimingFunctionEaseOut 后慢|
//     kCAMediaTimingFunctionEaseInEaseOut 先慢 后慢 中间快|
//     kCAMediaTimingFunctionDefault 默认|
//     )
//     */
//    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
//    
//    
//    /*动画效果
//     (
//     kCATransitionFade淡出|
//     kCATransitionMoveIn覆盖原图|
//     kCATransitionPush推出|
//     kCATransitionReveal底部显出来
//     )
//     */
//    [animation setType:kCATransitionPush];
//    
////    /*动画方向
////     (
////     kCATransitionFromRight|
////     kCATransitionFromLeft|
////     kCATransitionFromTop|
////     kCATransitionFromBottom
////     )
////     */
////    if (nextControllerIndex < currentControllerIndex)
////        [animation setSubtype:kCATransitionFromRight];
////    else
////        [animation setSubtype:kCATransitionFromLeft];
//    
//    [v.layer addAnimation:animation forKey:@"Reveal"];
}

+(void)sizeHeightAnimation:(UIView *)v  sizeH:(float)sizeH orgY:(float)orgy{
    
    [UIView animateWithDuration:0.2 animations:^{
        CGRect detailRect = v.frame;
        detailRect.size.height = sizeH;
        detailRect.origin.y = orgy;
        [v setFrame:detailRect];
        
    }];
}

+(void)sizeHeightAnimation:(UIView *)v  sizeH:(float)sizeH{
    
    
    
    [UIView animateWithDuration:0.4 animations:^{
        CGRect detailRect = v.frame;
        detailRect.size.height = sizeH;
        [v setFrame:detailRect];
        
    }];
}

+(void)orgXAnimation:(UIView *)v  orgx:(float)orgx{
    
   
     
    [UIView animateWithDuration:0.5 animations:^{
        CGRect detailRect = v.frame;
        detailRect.origin.x = orgx;
        [v setFrame:detailRect];
    }];
}

+(void)orgXAnimationTwo:(UIView *)v  orgx:(float)orgx{
    
    
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect detailRect = v.frame;
        detailRect.origin.x = orgx-30;
        [v setFrame:detailRect];
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.4 animations:^{
            CGRect detailRect = v.frame;
            detailRect.origin.x = orgx;
            [v setFrame:detailRect];
        }];
        
    }];
}

+(void)orgXAnimation:(UIView *)v orgx:(float)orgx OrgX2:(float)orgx2{
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGRect detailRect = v.frame;
                         detailRect.origin.x = orgx;
                         [v setFrame:detailRect];
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1.0
                                          animations:^{
                                              CGRect detailRect = v.frame;
                                              detailRect.origin.x = orgx2;
                                              [v setFrame:detailRect];
                                          }
                                          completion:^(BOOL finished){
                                              ;
                                          }];
                     }]; 
   
}
+(void)scaleAnimation:(UIView *)v{
    
    [UIView animateWithDuration:0.2
                     animations:^{
                         v.transform = CGAffineTransformMakeScale(1.6, 1.6);
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.2
                                          animations:^{
                                             v.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                          }
                                          completion:^(BOOL finished){
                                              ;
                                          }];
                     }];
    
}

+(void)orgXAnimation:(UIView *)v  orgx:(float)orgx orgy:(float)orgy{
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect detailRect = v.frame;
        detailRect.origin.x = orgx;
        detailRect.origin.y = orgy;
        [v setFrame:detailRect];
    }];
    
}

+(void)orgXAnimation:(UIView *)v  orgx:(float)orgx duration:(float)dur{
     
    
    [UIView animateWithDuration:dur animations:^{
        CGRect detailRect = v.frame;
        detailRect.origin.x = orgx;
        [v setFrame:detailRect];
    }];
    
}

+(void)orgYAnimation:(UIView *)v  orgY:(float)orgy duration:(float)dur{
     
    [UIView animateWithDuration:dur animations:^{
        CGRect detailRect = v.frame;
        detailRect.origin.y = orgy;
        [v setFrame:detailRect];
    }];
}



+(void)sharke :(UIView *)vv num:(float)num{
    
    
    [UIView beginAnimations:@"movement" context:nil]; 
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn]; //<label id="code.timingcurve.easeIn"/>
    [UIView setAnimationDuration:0.1f];
    [UIView setAnimationRepeatCount:2];
    // [UIView setAnimationRepeatAutoreverses:YES];
    //  [UIView setAnimationRepeatAutoreverses:NO];
    if (vv.frame.origin.x==num) {
        vv.frame = CGRectMake(vv.frame.origin.x-5, vv.frame.origin.y, vv.frame.size.width, vv.frame.size.height);
    }else {
        vv.frame = CGRectMake(vv.frame.origin.x+5, vv.frame.origin.y, vv.frame.size.width, vv.frame.size.height);
    }
//    if (vv.frame.origin.x==num) {
//        vv.frame = CGRectMake(vv.frame.origin.x-5, vv.frame.origin.y, vv.frame.size.width, vv.frame.size.height);
//        
//    }else {
//        vv.frame = CGRectMake(vv.frame.origin.x+5, vv.frame.origin.y, vv.frame.size.width, vv.frame.size.height);
//    }
    [UIView commitAnimations];
    
//    NSLog(@"%f",vv.frame.origin.x);
    //    //定时器
    //    showTimer = [NSTimer scheduledTimerWithTimeInterval:0.1
    //                                                 target:self
    //                                               selector:@selector(btn)
    //                                               userInfo:nil
    //                                                repeats:YES];
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
