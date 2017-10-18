//
//  ViewController.m
//  PJKeyframeAnimation
//
//  Created by piaojin on 2017/10/18.
//  Copyright © 2017年 piaojin. All rights reserved.
//

#import "ViewController.h"

#define angle2Radian(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()<CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIButton *keyFrameAnimation1;
@property (weak, nonatomic) IBOutlet UIButton *keyFrameAnimation2;
@property (weak, nonatomic) IBOutlet UIButton *shakeAnimation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 第一种方式*/
- (IBAction)animation1:(id)sender {
    UIView *animationView = (UIView *)sender;
    //1. 创建动画
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //2. 告诉系统要执行什么动画
    NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(200, 200)];
    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    //3. 保存动画
    keyframeAnimation.values = @[value1,value2,value3,value4,value5];
    //4. 设置动画执行完毕后，不删除动画
    keyframeAnimation.removedOnCompletion=NO;
    //5. 设置保存动画的最新状态
    keyframeAnimation.fillMode=kCAFillModeForwards;
    //6. 设置动画执行的时间
    keyframeAnimation.duration=4.0;
    //7. 设置动画的节奏
    keyframeAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //设置动画代理
    keyframeAnimation.delegate = self;
    [animationView.layer addAnimation:keyframeAnimation forKey:nil];
}

/** 第二种方式（使用path）让layer在指定的路径上移动（画圆）*/
- (IBAction)animation2:(id)sender {
    UIView *animationView = (UIView *)sender;
    //1. 创建动画
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //创建一条路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置一个圆的路径
    CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 100, 100, 100));
    keyframeAnimation.path = path;
    //有create就一定要有release
    CGPathRelease(path);
    //2. 设置动画执行完毕后，不删除动画
    keyframeAnimation.removedOnCompletion=NO;
    //3. 设置保存动画的最新状态
    keyframeAnimation.fillMode=kCAFillModeForwards;
    //4. 设置动画执行的时间
    keyframeAnimation.duration=4.0;
    //5. 设置动画的节奏
    keyframeAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //设置动画代理
    keyframeAnimation.delegate = self;
    [animationView.layer addAnimation:keyframeAnimation forKey:@"piaojin"];
}
- (IBAction)shakeAnimation:(id)sender {
    UIView *animationView = (UIView *)sender;
    //1.创建核心动画
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animation];
    keyframeAnimation.keyPath = @"transform.rotation";
    //设置动画时间
    keyframeAnimation.duration = 0.1;
    //设置图标抖动弧度
    //把度数转换为弧度  度数/180*M_PI
    keyframeAnimation.values = @[@(-angle2Radian(4)),@(angle2Radian(4)),@(-angle2Radian(4))];
    //设置动画的重复次数(设置为最大值)
    keyframeAnimation.repeatCount = MAXFLOAT;
    keyframeAnimation.fillMode = kCAFillModeForwards;
    keyframeAnimation.removedOnCompletion = NO;
    //2.添加动画
    [animationView.layer addAnimation:keyframeAnimation forKey:nil];
}

- (IBAction)stopAnimation:(id)sender {
    //停止名称为“piaojin”的动画
    [self.keyFrameAnimation2.layer removeAnimationForKey:@"piaojin"];
}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"动画开始");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"动画结束");
}

@end
