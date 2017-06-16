//
//  PushAnimation.m
//  TransitionAnimationDemo
//
//  Created by 丁宏山 on 17/6/15.
//  Copyright © 2017年 zaodao. All rights reserved.
//

#import "PushAnimation.h"
#import "ViewController.h"
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define kWidthOnePiex WIDTH/1080
#define kHeightOnePiex HEIGHT/1920

@implementation PushAnimation
// 指定动画的持续时长
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.8;
}

// 转场动画的具体内容
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    // 获取动画的源控制器和目标控制器
    
    UIViewController *desController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    ViewController *srcController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:desController.view];
    desController.view.alpha = 0.0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        srcController.topView.frame = CGRectMake(0, -kHeightOnePiex * 1009, WIDTH, kHeightOnePiex * 1009);
        srcController.bottomView.frame = CGRectMake(0, HEIGHT, WIDTH, kHeightOnePiex * 1102);
        desController.view.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        
        srcController.topView.frame = CGRectMake(0, 0, WIDTH, kHeightOnePiex * 1009);
        srcController.bottomView.frame = CGRectMake(0, HEIGHT - kHeightOnePiex * 1102, WIDTH, kHeightOnePiex * 1102);
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];

}

@end
