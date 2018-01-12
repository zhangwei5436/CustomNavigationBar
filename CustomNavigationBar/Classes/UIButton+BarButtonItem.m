//
//  UIButton+BarButtonItem.m
//  CustomNavigationBarDemo
//
//  Created by 张威 on 2018/1/10.
//  Copyright © 2018年 张威. All rights reserved.
//

#import "UIButton+BarButtonItem.h"

@implementation UIButton (BarButtonItem)

+(UIButton *)itemWithTarget:(id)target action:(SEL)action image:(UIImage *)image {
    return [self itemWithTarget:target action:action nomalImage:image highlightedImage:nil imageEdgeInsets:UIEdgeInsetsZero];
}

+(UIButton *)itemWithTarget:(id)target action:(SEL)action image:(UIImage *)image imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets{
    
    return [self itemWithTarget:target action:action nomalImage:image highlightedImage:nil imageEdgeInsets:imageEdgeInsets];
}

+(UIButton *)itemWithTarget:(id)target
                     action:(SEL)action
                 nomalImage:(UIImage *)nomalImage
           highlightedImage:(UIImage *)highlightedImage
            imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setImage:nomalImage forState:UIControlStateNormal];
    if (highlightedImage) {
        [button setImage:highlightedImage forState:UIControlStateHighlighted];
    }
    button.imageEdgeInsets = imageEdgeInsets;
    return button;
}

+(UIButton *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title{
    
    return [self itemWithTarget:target action:action title:title font:nil titleColor:nil highlightedColor:nil titleEdgeInsets:UIEdgeInsetsZero];
}

+(UIButton *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets{
    
    return [self itemWithTarget:target action:action title:title font:nil titleColor:nil highlightedColor:nil titleEdgeInsets:titleEdgeInsets];
}

+(UIButton*)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor highlightedColor:(UIColor *)highlightedColor titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor ? titleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:highlightedColor ? highlightedColor:nil forState:UIControlStateHighlighted];
    button.titleLabel.font = font ? font :nil;
    button.titleEdgeInsets = titleEdgeInsets;
    return button;
}
@end
