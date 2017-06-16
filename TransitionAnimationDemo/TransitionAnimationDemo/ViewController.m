//
//  ViewController.m
//  TransitionAnimationDemo
//
//  Created by 早道 on 2017/6/15.
//  Copyright © 2017年 zaodao. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "PushAnimation.h"

#define    WIDTH [UIScreen mainScreen].bounds.size.width 
#define  HEIGHT [UIScreen mainScreen].bounds.size.height

#define kWidthOnePiex WIDTH/1080
#define kHeightOnePiex HEIGHT/1920

@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    self.topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,kHeightOnePiex *1009)];
    self.topView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.topView];
    
    UIImageView *topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kHeightOnePiex *1009)];
    topImageView.image = [UIImage imageNamed:@"背景绿色拷贝"];
    [self.topView addSubview:topImageView];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(self.view.frame.size.width-80, 70, 60, 30);
    rightBtn.backgroundColor = [UIColor orangeColor];
    [rightBtn setTitle:@">" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:rightBtn];

    self.bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT - kHeightOnePiex * 1102, self.view.frame.size.width, kHeightOnePiex * 1102)];
    self.bottomView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.bottomView];
    
    UIImageView *bottomImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kHeightOnePiex * 1102)];
    bottomImageView.image = [UIImage imageNamed:@"底部色"];
    [self.bottomView addSubview:bottomImageView];
    
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    centerBtn.frame = CGRectMake(self.view.frame.size.width/2 -50, 50, 100, 50);
    centerBtn.backgroundColor = [UIColor blackColor];
    [centerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [centerBtn setTitle:@"push" forState:UIControlStateNormal];
    [self.bottomView addSubview:centerBtn];
    [centerBtn addTarget:self action:@selector(centerClicked:) forControlEvents:UIControlEventTouchUpInside];
    }


- (void)rightClicked:(UIButton *)sender {

    ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:thirdVC animated:YES];
}

- (void)centerClicked:(UIButton *)sender {
    SecondViewController *secVC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:secVC animated:YES];

}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush){  // 就是在这里判断是哪种动画类型
        
        if (fromVC == self && [toVC isKindOfClass:[SecondViewController class]]) {
            
            return [[PushAnimation alloc] init];
        } else {
            
            return nil;
        }
    } else {
       
        return nil;
    }
    
    
}



@end
