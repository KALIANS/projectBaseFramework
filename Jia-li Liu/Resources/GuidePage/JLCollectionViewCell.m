//
//  JLCollectionViewCell.m
//  NewFeatureDemo
//
//  Created by KLIANS on 2016/10/11.
//  Copyright © 2016年 KLIANS. All rights reserved.
//

#import "JLCollectionViewCell.h"
#import "JLExButton.h"
#import "UIView+LBExtension.h"

@interface JLCollectionViewCell()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation JLCollectionViewCell

- (UIImageView *)imageView
{
    if (!_imageView) {
        
        UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        _imageView = tempImageView;
        
        [self.contentView addSubview:_imageView];
    }
    
    return _imageView;
}

//重写set方法
- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
}

- (void)setCurrentPageIndex:(NSInteger)currentPage lastPageIndex:(NSInteger)lastIndex
{
    if (currentPage == lastIndex) {
        self.startButton.hidden = NO;
        [self.contentView addSubview:self.startButton];
    }else{
        [self.contentView addSubview:self.startButton];
        self.startButton.hidden = YES;
    }
}

//点击开始按钮的跳转
- (void)startAction:(JLExButton *)sender
{
    CATransition *anim = [[CATransition alloc] init];
    anim.type = @"rippleEffect";
    anim.duration = 1.0;
    [self.window.layer addAnimation:anim forKey:nil];
    self.window.rootViewController = self.toController;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initilzation];
    }
    return self;
}

//布局子控制器
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.startButton.layer setCornerRadius:25];
    //设置图片
    [self.startButton setImage:[UIImage imageNamed:self.imageNameStr] forState:UIControlStateNormal];
    //设置开始按钮的中心位置
    self.startButton.XLJLable.frame = CGRectMake(0, 0, self.startButton.frame.size.width, self.startButton.frame.size.height);
    self.startButton.center = CGPointMake(self.width / 2.0, self.height *self.startHeight);
}

- (void)initilzation
{
    JLExButton *tempStartButton = [JLExButton buttonWithType:UIButtonTypeCustom];
    tempStartButton.layer.cornerRadius = 2;
    tempStartButton.layer.masksToBounds = YES;
    //尺寸自适应
    [tempStartButton sizeToFit];
    
    //添加点击事件
    [tempStartButton addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    self.startButton = tempStartButton;
}

@end
