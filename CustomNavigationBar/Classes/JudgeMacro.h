//
//  JudgeMacro.h
//  CustomNavigationBarDemo
//
//  Created by 张威 on 2018/1/5.
//  Copyright © 2018年 张威. All rights reserved.
//

#ifndef JudgeMacro_h
#define JudgeMacro_h

#import "CustomNavigationBar.h"
#import "UIButton+BarButtonItem.h"
#import "NSBundle+BundlleCategory.h"


// 获得RGB颜色

#define RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RGBColor(r, g, b) RGBAColor(r,g,b,1.0)

#define kGlobalTintColor [UIColor colorWithHexString:@"007eff"]
#define kNavigationBarBg [UIColor colorWithHexString:@"F9F9F9"]
#define RandomColor RGBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//定义高度
#define kUIScreenSize [UIScreen mainScreen].bounds.size
#define kUIScreenWidth kUIScreenSize.width
#define kUIScreenHeight kUIScreenSize.height

/*
    SelfNavBarHeight  注:对于直接模态弹出，没有经过导航控制器包装的视图拿不到导航高度（如引导页） 会为0
    SelfTabBarHeight  注:没有经过tabbar控制器包装的视图拿不到底部导航高度 会为0
    StatusBarHeight   注:在刚启动的某些场景中会拿不到高度 会为0
 */
#define SelfNavBarHeight  self.navigationController.navigationBar.bounds.size.height
#define SelfTabBarHeight  self.tabBarController.tabBar.bounds.size.height
#define StatusBarHeight   [UIApplication sharedApplication].statusBarFrame.size.height


static inline CGFloat STATUSH() {
    if (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812))) {
        return 44.0; // iPhoneX
    } else {
        return 20.0;
    }
}
static inline CGFloat NAVH() {
    if (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812))) {
        return 44.0 + 44; // iPhoneX
    } else {
        return 20.0 + 44;
    }
}
static inline CGFloat TABH() {
    if (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812))) {
        return 49.0 + 34; // iPhoneX
    } else {
        return 49.0;
    }
}

static inline BOOL IsIphoneX()
{
    if (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812))) {
        return YES;; // iPhoneX
    } else {
        return NO;
    }
}

#endif /* JudgeMacro_h */
