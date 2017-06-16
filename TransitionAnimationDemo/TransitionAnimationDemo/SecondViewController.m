//
//  SecondViewController.m
//  TransitionAnimationDemo
//
//  Created by 早道 on 2017/6/15.
//  Copyright © 2017年 zaodao. All rights reserved.
//

#import "SecondViewController.h"
#import "PopAnimation.h"
#import "ViewController.h"
@interface SecondViewController ()<UINavigationControllerDelegate>
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES];
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"----2----";
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(10, 70, 60, 30);
    leftBtn.backgroundColor = [UIColor orangeColor];
    [leftBtn setTitle:@"<" forState:UIControlStateNormal];
    [self.view addSubview:leftBtn];
    [leftBtn addTarget:self action:@selector(leftClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)leftClicked:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPop) {
    
        if (fromVC == self && [toVC isKindOfClass:[ViewController class]]) {
            
            return [[PopAnimation alloc] init];
        } else {
            
            return nil;
        }

    } else {
        
        return nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
