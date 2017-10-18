//
//  ViewController.m
//  PJTransition
//
//  Created by piaojin on 2017/10/18.
//  Copyright © 2017年 piaojin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next:(id)sender {
    self.imageView.image = [UIImage imageNamed:@"logo_cat"];
    //创建核心动画
    CATransition *ca=[CATransition animation];
    //告诉要执行什么动画
    //设置过度效果
    ca.type=@"cube";
    //设置动画的过度方向（向左）
    ca.subtype=kCATransitionFromRight;
    //设置动画的时间
    ca.duration=2.0;
    //添加动画
    [self.imageView.layer addAnimation:ca forKey:nil];
}

@end
