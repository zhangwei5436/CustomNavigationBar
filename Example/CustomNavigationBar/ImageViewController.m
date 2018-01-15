//
//  ImageViewController.m
//  CustomNavigationBarDemo
//
//  Created by 张威 on 2018/1/9.
//  Copyright © 2018年 张威. All rights reserved.
//

#import "ImageViewController.h"
#import "CustomNavigationBar.h"
#import "JudgeMacro.h"
#import "UIButton+BarButtonItem.h"

@interface ImageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) CustomNavigationBar *customNavBar;
@property (nonatomic,strong) UITableView * tableView;
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpTableView];
    [self.view insertSubview:self.customNavBar aboveSubview:self.tableView];
    
    self.customNavBar.title = @"导航图片背景";
    self.customNavBar.titleTextColor = [UIColor cyanColor];
    self.customNavBar.barBackgroundImage = [UIImage imageNamed:@"imageNav"];
    [self.customNavBar zb_setBackgroundAlpha:0];
    
    if (@available(iOS 11.0, *)) { // 会缩进一个状态栏的高度
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    // 自定义 左边按钮
    UIButton * butt = [UIButton itemWithTarget:self action:@selector(click) title:@"返回"];
    [self.customNavBar zb_setNavigationCustomLeftButton:butt];
    
    UIButton * rightButton = [UIButton itemWithTarget:self action:@selector(rightClick) title:@"push返回" font:[UIFont systemFontOfSize:15] titleColor:nil highlightedColor:nil titleEdgeInsets:UIEdgeInsetsZero];
    rightButton.frame = CGRectMake(0, 0, 100, 100);
    rightButton.backgroundColor = [UIColor greenColor];
    [self.customNavBar zb_setNavigationCustomRightButton:rightButton];
    
    [self.customNavBar zb_setTintColor:[UIColor blackColor]];

}

-(void)rightClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)click
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setUpTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth, kUIScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor  orangeColor];
    
    self.tableView.rowHeight = 60;
    self.tableView.showsVerticalScrollIndicator = false;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0)
    {
        self.customNavBar.barBackgroundImage = [UIImage imageNamed:@"millcolorGrad"];
    }
    else
    {
        self.customNavBar.barBackgroundImage = [UIImage imageNamed:@"imageNav"];
    }
    
    [self.customNavBar zb_setBackgroundAlpha:(fabs(offsetY)/170)];
    NSLog(@"%f==%f",offsetY,(fabs(offsetY)/210));
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 14;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.textLabel.text = @"呵呵";
    cell.backgroundColor = [UIColor brownColor];
    return cell;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(CustomNavigationBar*)customNavBar
{
    if (_customNavBar == nil) {
        _customNavBar = [CustomNavigationBar customNavigationInstance];
    }
    return _customNavBar;
}
@end
