//
//  JLExButton.m
//  NewFeatureDemo
//
//  Created by KLIANS on 2016/10/11.
//  Copyright © 2016年 KLIANS. All rights reserved.
//

#import "JLExButton.h"
#import "UIView+LBExtension.h"

@interface JLExButton ()

@property (nonatomic, strong) tapAction tapButtonAction;

@end

@implementation JLExButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        [self setImage];
        self.backgroundColor = RGBA(254,246,80, 1);
        
    }
    return self;
}

- (void)setImage
{
    self.XLJImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.XLJImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.XLJImageView];
    
    self.XLJLable = [[UILabel alloc] initWithFrame:CGRectZero];
    self.XLJLable.backgroundColor = [UIColor clearColor];
    self.XLJLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.XLJLable];
    
    [self addTarget:self action:@selector(didClickedButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setTitleFrame:(CGRect)frame
{
    self.XLJLable.frame = frame;
}

- (void)setImageFrame:(CGRect)frame
{
    self.XLJImageView.frame = frame;
}

- (void)setTItleOriginX:(CGFloat)x sizeWidth:(CGFloat)width
{
    self.XLJLable.frame = CGRectMake(x, 0, width, self.size.height);
}

- (void)setImageOriginX:(CGFloat)x sizeWidth:(CGFloat)width
{
    self.XLJImageView.frame = CGRectMake(x, self.size.height/2.0 - width/2.0, width, width);
}

- (void)setTitleCenterWithWidth:(CGFloat)width
{
    self.XLJLable.frame = CGRectMake(self.size.width/2.0 - width/2.0, 0, width, self.size.height);
}

- (void)setImageCenterWithWidth:(CGFloat)width
{
    self.XLJImageView.frame = CGRectMake(self.size.width/2.0 - width/2.0, self.size.height/2.0 - width/2.0, width, width);
}

- (void)didClickedButtonAction:(JLExButton *)sender
{
    if (self.tapButtonAction) {
        self.tapButtonAction(sender);
    }
}
- (void)tapAction:(tapAction)action
{
    if (!action) return;
    
    self.tapButtonAction = action;
}

@end
