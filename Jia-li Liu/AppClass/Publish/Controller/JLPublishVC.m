//
//  SYPublishVC.m
//  Jia-li Liu
//
//  Created by KLIANS on 2017/4/27.
//  Copyright © 2017年 KLIANS. All rights reserved.
//

#import "JLPublishVC.h"

@interface JLPublishVC ()

@end

@implementation JLPublishVC

#pragma mark - ################################# 生命周期 #################################

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化UI
    [self setUI];
    //初始化数据
    [self setData];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

#pragma mark - ################################# 网络请求 ################################

#pragma mark - ################################# 代理方法 ################################

#pragma mark - ################################# 事件处理 ################################

#pragma mark - ################################# 声明的成员方法和类方法 #####################

#pragma mark - ################################# 私有方法 ################################

/**
 初始化UI
 */
- (void)setUI{
    self.title = @"发布";
    
    [self setLeftNav];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    JLViewBorderRadius(view, 50, 1, kGreenColor);
    [self.view addSubview:view];
}

-(void)setLeftNav{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    [button setTitle:@"关闭" forState:(UIControlStateNormal)
     ];
    [button setTitleColor:AppNavTitleColor forState:(UIControlStateNormal)];
    button.titleLabel.font = FONT(15);
    [button addTarget:self action:@selector(didTap) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}

-(void)didTap{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 初始化数据
 */
- (void)setData{
    
}

#pragma mark - ################################ 访问器方法 ################################

@end
