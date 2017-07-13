//
//  JLCollectionViewCell.h
//  NewFeatureDemo
//
//  Created by KLIANS on 2016/10/11.
//  Copyright © 2016年 KLIANS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JLExButton;
@interface JLCollectionViewCell : UICollectionViewCell
/**滚动图片*/
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) CGFloat startHeight;
@property (nonatomic, strong) UIViewController *toController;
@property (nonatomic, strong) JLExButton *startButton;
@property (nonatomic, strong) NSString *imageNameStr;

/**
 *  判断当前页码和最后一个页码
 *
 *  @param currentPage 当前页码
 *  @param lastIndex   最后一个页码
 */
- (void)setCurrentPageIndex:(NSInteger)currentPage lastPageIndex:(NSInteger)lastIndex;



@end
