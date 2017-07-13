//
//  JLDetailVC.m
//  Jia-li Liu
//
//  Created by KLIANS on 2017/4/19.
//  Copyright © 2017年 KLIANS. All rights reserved.
//

#import "JLDetailVC.h"
#import "JLVC.h"
@interface JLDetailVC ()<UIWebViewDelegate>
{
    MBProgressHUD *hud;
    UIWebView *web;
}
@end

@implementation JLDetailVC

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
-(void)injected{
    NSLog(@"I've been injected: %@", self);
    
}
/**
 初始化UI
 */
- (void)setUI{
    
    self.title = @"详情";
    self.view.backgroundColor = [UIColor whiteColor];

    [self setRightNav];
    
    web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.qcloud.com/?fromSource=gwzcw.5677.5677.5677"]];
    web.delegate = self;
    [web loadRequest:request];
    
    [JLProgressHUD showCusGif:nil inView:self.view];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [JLProgressHUD hide];
    
    [self.view addSubview: web];
    
    //这里是js，主要目的实现对url的获取
    NSString *articleImageUrl = [webView stringByEvaluatingJavaScriptFromString:@"document.images[0].src"];
    NSLog(@"imageurl===%@",articleImageUrl);
    
    NSString *IJs2 = @"document.getElementsByName('description')[0].content";
    
    NSString *lHtml2 = [webView stringByEvaluatingJavaScriptFromString:IJs2];
    
    CLog(@"%@",lHtml2);
}

-(void)setRightNav{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    [button setTitle:@"活动" forState:(UIControlStateNormal)
     ];
    [button setTitleColor:AppNavTitleColor forState:(UIControlStateNormal)];
    button.titleLabel.font = FONT(15);
    [button addTarget:self action:@selector(didTap) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}

-(void)didTap{
    JLVC *vc = [JLVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 初始化数据
 */
- (void)setData{
    
}

#pragma mark - ################################ 访问器方法 ################################

@end
