//
//  ZWViewController.m
//  CustomNavigationBar
//
//  Created by zhangwei5436 on 01/12/2018.
//  Copyright (c) 2018 zhangwei5436. All rights reserved.
//

#import "ZWViewController.h"
#import "JudgeMacro.h"
#import "MoveViewController.h"

@interface ZWViewController ()

@end

@implementation ZWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"测试demo";
    UIButton * btn = [UIButton itemWithTarget:self action:@selector(click) title:@"进去"];
    btn.frame = CGRectMake(30, 90, 100, 40);
    [self.view addSubview:btn];
}

-(void)click{
    MoveViewController * move = [MoveViewController new];
    [self.navigationController pushViewController:move animated:YES];
}

@end
