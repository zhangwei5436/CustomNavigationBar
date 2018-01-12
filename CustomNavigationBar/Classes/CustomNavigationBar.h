//
//  CustomNavigationBar.h
//  CustomNavigationBarDemo
//
//  Created by 张威 on 2018/1/5.
//  Copyright © 2018年 张威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavigationBar : UIView

@property (nonatomic, copy)   NSString * title;
@property (nonatomic, strong) UIColor  * titleTextColor;
@property (nonatomic, strong) UIFont   * titleTextFont;
@property (nonatomic, strong) UIColor  * barBackgroundColor;
@property (nonatomic, strong) UIImage  * barBackgroundImage;
@property (nonatomic, copy)   NSArray <UIButton *> * moreLeftButtons; // 多个左按钮
@property (nonatomic, copy)   NSArray <UIButton *> * moreRightButtons; 
@property (nonatomic,assign)    CGFloat offsetY; // 纵坐标偏移

+(instancetype)customNavigationInstance;

- (void)zb_setDefaultLeftButtonHidden:(BOOL)hidden;
- (void)zb_setBottomLineHidden:(BOOL)hidden;
- (void)zb_setBackgroundAlpha:(CGFloat)alpha;
- (void)zb_setTintColor:(UIColor *)color;
- (void)zb_setNavigationCustomLeftButton:(UIButton*)button; // 自定义导航左边按钮
- (void)zb_setNavigationCustomRightButton:(UIButton*)button; // 自定义导航右边按钮
@end
