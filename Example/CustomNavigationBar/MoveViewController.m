//
//  MoveViewController.m
//  CustomNavigationBarDemo
//
//  Created by 张威 on 2018/1/11.
//  Copyright © 2018年 张威. All rights reserved.
//

#import "MoveViewController.h"
#import "JudgeMacro.h"

@interface MoveViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) CustomNavigationBar *customNavBar;
@property (nonatomic,strong) UITableView * tableView;

@end

@implementation MoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpTableView];
    self.customNavBar.title = @"移动导航栏";
    [self.view addSubview:self.customNavBar];
    self.customNavBar.barBackgroundColor = [UIColor cyanColor];

    if (@available(iOS 11.0, *)) { // 会缩进一个状态栏的高度
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
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
        [UIView animateWithDuration:0.3 animations:^{
//            self.customNavBar.offsetY = -NAVH();
//            [self.customNavBar zb_setBackgroundAlpha:(fabs(offsetY)/170)];
            // 跟随的模式
            self.customNavBar.offsetY = -offsetY;
            [UIView animateWithDuration:1 animations:^{
                [self.customNavBar zb_setBackgroundAlpha:(fabs(10/offsetY))];
            }];
        }];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.customNavBar.offsetY = 0;
            [self.customNavBar zb_setBackgroundAlpha:1];
        }];
    }
    
    
    NSLog(@"%f==%f",offsetY,(fabs(100/offsetY)));
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
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


-(CustomNavigationBar*)customNavBar
{
    if (_customNavBar == nil) {
        _customNavBar = [CustomNavigationBar customNavigationInstance];
    }
    return _customNavBar;
}
@end
