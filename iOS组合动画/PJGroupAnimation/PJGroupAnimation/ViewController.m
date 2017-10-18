//
//  ViewController.m
//  PJGroupAnimation
//
//  Created by piaojin on 2017/10/18.
//  Copyright © 2017年 piaojin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)groupAnimation:(id)sender {
    UIView *animationView = (UIView *)sender;
    // 平移动画
    CABasicAnimation *a1 = [CABasicAnimation animation];
    a1.keyPath = @"transform.translation.y";
    a1.toValue = @(100);
    // 缩放动画
    CABasicAnimation *a2 = [CABasicAnimation animation];
    a2.keyPath = @"transform.scale";
    a2.toValue = @(0.0);
    // 旋转动画
    CABasicAnimation *a3 = [CABasicAnimation animation];
    a3.keyPath = @"transform.rotation";
    a3.toValue = @(M_PI_2);
    // 组动画
    CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
    groupAnima.animations = @[a1, a2, a3];
    //设置组动画的时间
    groupAnima.duration = 2;
    groupAnima.fillMode = kCAFillModeForwards;
    groupAnima.removedOnCompletion = NO;
    [animationView.layer addAnimation:groupAnima forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
