//
//  ViewController.m
//  PJBaseAnimation
//
//  Created by piaojin on 2017/10/18.
//  Copyright © 2017年 piaojin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIButton *rotateView;
@property (weak, nonatomic) IBOutlet UIButton *moveView;
@property (weak, nonatomic) IBOutlet UIButton *scaleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 动画代理
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"动画开始");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"动画结束");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rotateAnimation:(id)sender {
    UIView *animationView = (UIView *)sender;
    //1. 创建核心动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    //2. 设置动画执行时间
    animation.duration = 2.0;
    //3. 设置动画执行后不删除动画
    animation.removedOnCompletion = NO;
    //4. 设置动画执行后保存动画最新状态
    animation.fillMode = kCAFillModeForwards;
    //5. 设置修改属性
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2+M_PI_4, 1, 1, 0)];
    //6. 添加动画，即开始动画
    [animationView.layer addAnimation:animation forKey:nil];
}

- (IBAction)scaleAnimation:(id)sender {
    UIView *animationView = (UIView *)sender;
    //1. 创建核心动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    //2. 设置动画执行时间
    animation.duration = 2.0;
    //3. 设置动画执行后不删除动画
    animation.removedOnCompletion = NO;
    //4. 设置动画执行后保存动画最新状态
    animation.fillMode = kCAFillModeForwards;
    //5. 设置修改属性
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(animationView.frame.origin.x, animationView.frame.origin.y, 300.0, 300.0)];
    //6. 添加动画，即开始动画
    [animationView.layer addAnimation:animation forKey:nil];
}

- (IBAction)moveAnimation:(id)sender {
    UIView *animationView = (UIView *)sender;
    //1. 创建核心动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    //2. 告诉系统要执行什么样的动画
    animation.keyPath = @"position";
    //3. 设置动画从哪里移到哪里
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(animationView.frame.origin.x, animationView.frame.origin.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    //4. 设置动画执行完毕后不删除动画
    animation.removedOnCompletion = NO;
    //5. 设置保存动画的最新状态
    animation.fillMode = kCAFillModeForwards;
    //设置动画代理
    animation.delegate = self;
    //6. 添加核心动画到layer,添加即开始动画
    [animationView.layer addAnimation:animation forKey:nil];
}

@end
