//
//  UIImage+Image.h
//  KLIANS
//
//  Created by li  bo on 16/5/28.
//  Copyright © 2016年 li  bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

/**
 *  根据颜色生成一张图片
 *  @param color 提供的颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 * 根据尺寸和颜色生成图片 可设置透明度
 *  @param frame 提供的尺寸
 *  @param alphe 设置的透明度
 *  @param color 提供的颜色
*/
+ (UIImage *) imageWithFrame:(CGRect)frame alphe:(CGFloat)alphe Color:(UIColor *)color;
@end
