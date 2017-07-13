//
//  JLNewFetureController.h
//  NewFeatureDemo
//
//  Created by KLIANS on 2016/10/11.
//  Copyright © 2016年 KLIANS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LBExtension.h"
#import "JLExButton.h"

@interface JLNewFetureController : UIViewController

/**
 *  初始化
 *
 *  @param array       传入一个数组
 *  @param buttonSize  按钮的宽度和高度
 *  @param buttonTitle 按钮显示的文字
 *  @param imageName   按钮的图片
 *  @param titleColor  按钮文字的颜色
 *  @param startHeight 按钮的Y的比率
 *  @param controller  按钮点击跳转的界面
 *
 *  @return self
 */
- (instancetype)initWithNSArray:(NSMutableArray *)array withButtonSize:(CGSize)buttonSize withButtonTitle:(NSString *)buttonTitle withButtonImage:(NSString *)imageName withButtonTitleColor:(UIColor *)titleColor withButtonHeight:(CGFloat)startHeight withViewController:(UIViewController *)controller;
@end
