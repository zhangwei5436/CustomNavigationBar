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
#import "ImageViewController.h"

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
    
    
    UIButton * btn1 = [UIButton itemWithTarget:self action:@selector(click1) title:@"图片背景"];
    btn1.frame = CGRectMake(30, 190, 100, 40);
    [self.view addSubview:btn1];
    
    
}

-(void)click{
    MoveViewController * move = [MoveViewController new];
    [self.navigationController pushViewController:move animated:YES];
}

-(void)click1{
    
    ImageViewController * image = [ImageViewController new];
    [self.navigationController pushViewController:image animated:YES];
}

@end
