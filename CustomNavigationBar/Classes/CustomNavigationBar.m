//
//  CustomNavigationBar.m
//  CustomNavigationBarDemo
//
//  Created by 张威 on 2018/1/5.
//  Copyright © 2018年 张威. All rights reserved.
//

#import "CustomNavigationBar.h"
#import "JudgeMacro.h"

#define DefaultTitleSize 18
#define DefaultTitleColor [UIColor blackColor]
#define DefaultBackgroundColor [UIColor whiteColor]
#define buttonWidth  45
#define buttonHeight 44
#define titleLabelHeight 44
@implementation UIViewController (VCRouterHelp)

-(void)backToLastViewController
{
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count == 1) {
            if (self.presentingViewController) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else if(self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

+(UIViewController*)getCurrentViewController
{
    UIViewController * rootVC = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [self currentViewControllerFrom:rootVC];
}

+(UIViewController *)currentViewControllerFrom:(UIViewController*)viewController
{
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController * navigationController = (UINavigationController *)viewController;
        return [self currentViewControllerFrom:navigationController.viewControllers.lastObject];
    }else if ([viewController isKindOfClass:[UITabBarController class]]){
        UITabBarController* tabBarController = (UITabBarController *)viewController;
        return [self currentViewControllerFrom:tabBarController.selectedViewController];
    }else if (viewController.presentedViewController != nil){
        return [self currentViewControllerFrom:viewController.presentedViewController];
    }else{
        return viewController;
    }
}
@end

@interface CustomNavigationBar()

@property (nonatomic, strong) UILabel     * titleLable;
@property (nonatomic, strong) UIButton    * defaultLeftButton; // 默认左边按钮
@property (nonatomic, strong) UIButton    * rightButton;
@property (nonatomic, strong) UIView      * bottomLine;
@property (nonatomic, strong) UIView      * backgroundView;
@property (nonatomic, strong) UIImageView * backgroundImageView; // 背景图片
@property (nonatomic, assign) NSInteger maxLeftWidth;  // 左边按钮总共的宽度
@property (nonatomic, assign) NSInteger maxRightWidth; // 右边按钮总共的宽度
@end

@implementation CustomNavigationBar

+(instancetype)customNavigationInstance
{
    CustomNavigationBar * navgationBar = [[self alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth,NAVH())];
    return navgationBar;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self setUpChildViews];
//        if (IsIphoneX()) {
//            self.backgroundColor = [UIColor cyanColor];
//        }
    }
    return self;
}

-(void)setUpChildViews
{
    [self addSubview:self.backgroundView];
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.titleLable];
    [self addSubview:self.defaultLeftButton];
    [self addSubview:self.bottomLine];
    
    [self setUpViewsFrame];
}

-(void)setUpViewsFrame{
    NSInteger top = StatusBarHeight != 0 ? StatusBarHeight : STATUSH();
    NSInteger margin = 0;
    NSInteger titleLabelWidth = 180;
    
    self.backgroundView.frame = self.bounds;
    self.backgroundImageView.frame = self.bounds;
    self.defaultLeftButton.frame  = CGRectMake(margin, top, buttonWidth, buttonHeight);
    self.titleLable.frame  =  CGRectMake(0, top, titleLabelWidth, titleLabelHeight);
    self.titleLable.center = CGPointMake(self.center.x, self.titleLable.center.y);
    self.bottomLine.frame  = CGRectMake(margin, (CGFloat)(self.bounds.size.height-0.5), kUIScreenWidth, 0.5);
    self.maxLeftWidth = buttonWidth;
}
/*
    更新标题的宽度
 */

-(void)updateTitleLabelFrame{
    // 剩下的宽度
    CGFloat remainWidth = kUIScreenWidth - self.maxLeftWidth - self.maxRightWidth;
    
    if (self.title) {
        
        CGFloat titleLabelWidth = 180;
        // 根据内容适配宽度
        CGSize titleLabelSize = [self.title sizeWithAttributes:@{NSFontAttributeName:(self.titleTextFont !=nil ? self.titleTextFont : [UIFont boldSystemFontOfSize:DefaultTitleSize])}];
        
        if (titleLabelSize.width > remainWidth) {
            titleLabelWidth = remainWidth;
        }else{
            titleLabelWidth = titleLabelSize.width;
        }
        
        CGFloat fitTitleLableMaxX = self.center.x + titleLabelWidth/2;
        CGFloat fitTitleLabelMinX = self.center.x - titleLabelWidth/2;
        
        CGFloat rightBtnMinX   = kUIScreenWidth - self.maxRightWidth;
        CGFloat leftBtnMaxX    = self.maxLeftWidth;
        
        // 应该 用centerx 加上宽度的一半  来作比较
        if (fitTitleLableMaxX>rightBtnMinX) {
            self.titleLable.frame = CGRectMake(fitTitleLabelMinX-(fitTitleLableMaxX-rightBtnMinX), self.titleLable.frame.origin.y, titleLabelWidth, titleLabelHeight);
        }else if (fitTitleLabelMinX<leftBtnMaxX){
            self.titleLable.frame = CGRectMake(fitTitleLabelMinX+(leftBtnMaxX-fitTitleLabelMinX), self.titleLable.frame.origin.y, titleLabelWidth, titleLabelHeight);
        }else{
            self.titleLable.frame = CGRectMake(self.titleLable.frame.origin.x, self.titleLable.frame.origin.y, titleLabelWidth, titleLabelHeight);
            self.titleLable.center = CGPointMake(self.center.x, self.titleLable.center.y);
        }
    }
}

#pragma mark- 导航栏偏好设置
- (void)zb_setDefaultLeftButtonHidden:(BOOL)hidden{
    self.defaultLeftButton.hidden = hidden;
    if (!hidden) {
        self.maxLeftWidth = 0;
    }else{
        self.maxLeftWidth = self.defaultLeftButton.bounds.size.width;
    }
}

- (void)zb_setBottomLineHidden:(BOOL)hidden {
    self.bottomLine.hidden = hidden;
}

- (void)zb_setBackgroundAlpha:(CGFloat)alpha {
    self.backgroundView.alpha = alpha;
    self.backgroundImageView.alpha = alpha;
    self.bottomLine.alpha = alpha;
}

- (void)zb_setTintColor:(UIColor *)color {
    [self.defaultLeftButton setTitleColor:color forState:UIControlStateNormal];
    [self.rightButton setTitleColor:color forState:UIControlStateNormal];
    [self.titleLable setTextColor:color];
}

- (void)zb_setNavigationCustomLeftButton:(UIButton*)button{
    [self.defaultLeftButton removeFromSuperview];
    NSInteger top = StatusBarHeight != 0 ? StatusBarHeight : STATUSH();
    NSInteger btnw = 0;
    btnw = button.bounds.size.width > buttonWidth ? button.bounds.size.width : buttonWidth;
    button.frame = CGRectMake(0, top, btnw, buttonHeight);
    [self addSubview:button];
    self.defaultLeftButton = button; // 这里 方便 自定义之后的一键设置TintColor颜色
    self.maxLeftWidth = button.bounds.size.width;
}

- (void)zb_setNavigationCustomRightButton:(UIButton*)button{
    self.rightButton = button;
    NSInteger top = StatusBarHeight != 0 ? StatusBarHeight : STATUSH();
    NSInteger btnw = 0;
    btnw = button.bounds.size.width > buttonWidth ? button.bounds.size.width : buttonWidth;
    self.rightButton.frame = CGRectMake(kUIScreenWidth - btnw , top, btnw, buttonHeight);
    [self addSubview:self.rightButton];
    self.maxRightWidth = self.rightButton.bounds.size.width;
}

#pragma mark - 导航栏默认左按钮返回事件
-(void)clickBack {
    UIViewController *currentVC = [UIViewController getCurrentViewController];
    [currentVC backToLastViewController];
}

#pragma mark - setter
-(void)setTitle:(NSString *)title{
    _title = title;
    self.titleLable.hidden = NO;
    self.titleLable.text = title;
    [self updateTitleLabelFrame];
}

-(void)setTitleTextColor:(UIColor *)titleTextColor{
    _titleTextColor = titleTextColor;
    self.titleLable.textColor = titleTextColor;
}

-(void)setTitleTextFont:(UIFont *)titleTextFont{
    _titleTextFont = titleTextFont;
    self.titleLable.font = titleTextFont;
}

-(void)setBarBackgroundColor:(UIColor *)barBackgroundColor{
    _barBackgroundColor = barBackgroundColor;
    self.backgroundImageView.hidden = YES;
    self.backgroundView.hidden = NO;
    self.backgroundView.backgroundColor = _barBackgroundColor;
}

-(void)setBarBackgroundImage:(UIImage *)barBackgroundImage{
    _barBackgroundImage = barBackgroundImage;
    self.backgroundView.hidden = YES;
    self.backgroundImageView.hidden = NO;
    self.backgroundImageView.image = _barBackgroundImage;
}

-(void)setOffsetY:(CGFloat)offsetY{
    _offsetY = offsetY;
    self.frame = CGRectMake(self.frame.origin.x, offsetY, self.bounds.size.width, self.bounds.size.height);
}
/*
  目前 最多支持添加两个左按钮
 */
-(void)setMoreLeftButtons:(NSArray<UIButton *> *)moreLeftButtons{
    _moreLeftButtons = moreLeftButtons;
    [self.defaultLeftButton removeFromSuperview];
    self.maxLeftWidth = 0;
    NSInteger top = StatusBarHeight != 0 ? StatusBarHeight : STATUSH();
    NSInteger count = moreLeftButtons.count > 2 ? 2 :(moreLeftButtons.count);
    
    for (int j = 0; j<count; j++) {
        UIButton * btn = moreLeftButtons[j];
        NSInteger btnw = 0;
        btnw = btn.bounds.size.width > buttonWidth ? btn.bounds.size.width : buttonWidth;
        btn.frame = CGRectMake(j*self.maxLeftWidth, top, btnw, buttonHeight);
        [self addSubview:btn];
        self.maxLeftWidth += btnw;
    }
    
}

/*
 目前 最多支持添加3个右按钮
 */
-(void)setMoreRightButtons:(NSArray<UIButton *> *)moreRightButtons{
    _moreRightButtons = moreRightButtons;
    [self.rightButton removeFromSuperview];
    self.maxRightWidth = 0;
    NSInteger top = StatusBarHeight != 0 ? StatusBarHeight : STATUSH();
    NSInteger count = moreRightButtons.count > 3 ? 3 :(moreRightButtons.count);
    
    for (int j = 0; j<count; j++) {
        UIButton * btn = moreRightButtons[j];
        NSInteger btnw = 0;
        if (count==3) {
            btnw = buttonWidth;
        }else{
            btnw = btn.bounds.size.width > buttonWidth ? btn.bounds.size.width : buttonWidth;
        }
        btn.frame = CGRectMake(kUIScreenWidth -(self.maxRightWidth+btnw), top, btnw, buttonHeight);
        [self addSubview:btn];
        self.maxRightWidth += btnw;
    }
}

-(void)setMaxLeftWidth:(NSInteger)maxLeftWidth{
    _maxLeftWidth = maxLeftWidth;
    [self updateTitleLabelFrame];
}

-(void)setMaxRightWidth:(NSInteger)maxRightWidth{
    _maxRightWidth = maxRightWidth;
    [self updateTitleLabelFrame];
}

#pragma mark-getter
// 默认的按钮
-(UIButton *)defaultLeftButton
{
    if (!_defaultLeftButton) {
        _defaultLeftButton = [[UIButton alloc] init];
        [_defaultLeftButton addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
        _defaultLeftButton.imageView.contentMode = UIViewContentModeCenter;
        
        NSBundle *currentBundle = [NSBundle core_myLibraryBundle:@"CustomNavigationBar" forClass:[self class]];
        UIImage * image = [UIImage imageNamed:@"navigation_back" inBundle:currentBundle compatibleWithTraitCollection:nil];
        [_defaultLeftButton setImage:image forState:UIControlStateNormal];
//        _leftButton.hidden = NO;
    }
    return _defaultLeftButton;
}

-(UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.textColor = DefaultTitleColor;
        _titleLable.font = [UIFont systemFontOfSize:DefaultTitleSize];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.hidden = YES;
    }
    return _titleLable;
}
- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = RGBColor(218, 218, 218);
    }
    return _bottomLine;
}
- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] init];
        _backgroundView.backgroundColor = DefaultBackgroundColor;
    }
    return _backgroundView;
}
-(UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.hidden = YES;
    }
    return _backgroundImageView;
}
@end
