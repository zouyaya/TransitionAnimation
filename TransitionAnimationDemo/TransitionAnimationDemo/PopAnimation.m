//
//  PopAnimation.m
//  -
//
//  Created by 早道 on 2017/6/15.
//  Copyright © 2017年 zaodao. All rights reserved.
//

#import "PopAnimation.h"
#import "ViewController.h"
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define kWidthOnePiex WIDTH/1080
#define kHeightOnePiex HEIGHT/1920

@implementation PopAnimation
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8;
}
/* 动画的内容 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    ViewController *desController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //UIViewController *srcController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    desController.topView.frame = CGRectMake(0, -HEIGHT/2, WIDTH, HEIGHT/2);
    desController.bottomView.frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT/2);
    [[transitionContext containerView] addSubview:desController.view];
    desController.view.alpha = 0.0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        desController.topView.frame = CGRectMake(0, 0, WIDTH, kHeightOnePiex * 1009);
        desController.bottomView.frame = CGRectMake(0, HEIGHT - kHeightOnePiex * 1102, WIDTH, kHeightOnePiex * 1102);
        desController.view.alpha = 1.0;
        
    } completion:^(BOOL finished) {

        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}
@end
