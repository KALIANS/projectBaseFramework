//
//  JLMineVC.m
//  Jia-li Liu
//
//  Created by KLIANS on 2017/4/19.
//  Copyright © 2017年 KLIANS. All rights reserved.
//

#import "JLMineVC.h"
#import "UIImage+Image.h"
@interface JLMineVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *mainTable;

@end

@implementation JLMineVC

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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:str];
    }
    cell.textLabel.text = @"123";
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    if (point.y < - ScreenWidth/ 1.7) {
        CGRect rect = [self.mainTable viewWithTag:101].frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        [self.mainTable viewWithTag:101].frame = rect;
    }
    
    if (point.y > 10) {
        self.navigationController.navigationBarHidden = NO;
    }else{
        self.navigationController.navigationBarHidden = YES;
    }
    
    
}

#pragma mark - ################################# 事件处理 ################################

#pragma mark - ################################# 声明的成员方法和类方法 #####################

#pragma mark - ################################# 私有方法 ################################

/**
 初始化UI
 */
- (void)setUI{
    //隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
    
    //添加列表
    [self.view addSubview:self.mainTable];
    
    //添加头部背景
    self.mainTable.contentInset = UIEdgeInsetsMake(ScreenWidth/ 1.7, 0, 0, 0);
    UIImageView *beixImage = [[UIImageView alloc] init];
    beixImage.clipsToBounds = YES;
    beixImage.image = JLGetImage(@"wallPager");
    beixImage.contentMode = UIViewContentModeScaleAspectFill;
    beixImage.tag = 101;
    [self.mainTable addSubview:beixImage];
    beixImage.sd_layout.xIs(0).yIs(-ScreenWidth/ 1.7).widthIs(ScreenWidth).heightIs(ScreenWidth/ 1.7);
    
    //头像
    UIButton *icon = [[UIButton alloc]init];
    icon.layer.cornerRadius = 30;
    icon.layer.borderColor = kGrayColor.CGColor;
    icon.layer.borderWidth = 1;
    icon.backgroundColor = kBlueColor;
    [beixImage addSubview:icon];
    icon.sd_layout.xIs(ScreenWidth/2-30).bottomSpaceToView(beixImage,120).widthIs(60).heightIs(60);
    
    //昵称
    UILabel *name = [[UILabel alloc]init];
    name.textColor = kBlackColor;
    name.font = FONT(17);
    name.textAlignment = NSTextAlignmentCenter;
    name.text = @"KLIANS";
    [beixImage addSubview:name];
    name.sd_layout.topSpaceToView(icon,10).leftSpaceToView(beixImage,ScreenWidth*.2).rightSpaceToView(beixImage,ScreenWidth*.2).heightIs(30);
    
}

/**
 初始化数据
 */
- (void)setData{
    
}

#pragma mark - ################################ 访问器方法 ################################
-(UITableView *)mainTable{
    if (_mainTable == nil) {
        _mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:(UITableViewStyleGrouped)];
        _mainTable.delegate = self;
        _mainTable.dataSource = self;
        _mainTable.showsVerticalScrollIndicator = NO;
    }
    return _mainTable;
}

@end
