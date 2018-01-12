//
//  UIButton+BarButtonItem.h
//  CustomNavigationBarDemo
//
//  Created by 张威 on 2018/1/10.
//  Copyright © 2018年 张威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BarButtonItem)
/**
 根据图片生成UIButton
 
 @param target target对象
 @param action 响应方法
 @param image image
 @return 生成的UIButton
 */
+(UIButton *)itemWithTarget:(id)target action:(SEL)action image:(UIImage *)image;

/**
 根据图片生成UIButton
 
 @param target target对象
 @param action 响应方法
 @param image image
 @param imageEdgeInsets 图片偏移
 @return 生成的UIButton
 */
+(UIButton *)itemWithTarget:(id)target action:(SEL)action image:(UIImage *)image imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets;

/**
 根据图片生成UIButton
 
 @param target target对象
 @param action 响应方法
 @param nomalImage nomalImage
 @param highlightedImage highlightedImage
 @param imageEdgeInsets 图片偏移
 @return 生成的UIButton
 */
+(UIButton *)itemWithTarget:(id)target
                            action:(SEL)action
                 nomalImage:(UIImage *)nomalImage
                 highlightedImage:(UIImage *)highlightedImage
                 imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets;

/**
 根据文字生成UIButton
 
 @param target target对象
 @param action 响应方法
 @param title title
 */
+(UIButton *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title;

/**
 根据文字生成UIButton
 
 @param target target对象
 @param action 响应方法
 @param title title
 @param titleEdgeInsets 文字偏移
 @return 生成的UIButton
 */
+(UIButton *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets;

/**
 根据文字生成UIButton
 
 @param target target对象
 @param action 响应方法
 @param title title
 @param font font
 @param titleColor 字体颜色
 @param highlightedColor 高亮颜色
 @param titleEdgeInsets 文字偏移
 @return 生成的UIButton
 */
+(UIButton*)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor highlightedColor:(UIColor *)highlightedColor titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets;
@end
