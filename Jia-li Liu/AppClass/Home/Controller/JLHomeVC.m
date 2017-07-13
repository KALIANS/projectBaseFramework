//
//  JLHomeVC.m
//  Jia-li Liu
//
//  Created by KLIANS on 2017/4/19.
//  Copyright © 2017年 KLIANS. All rights reserved.
//

#import "JLHomeVC.h"

#import "JLDetailVC.h"

#import "LivesCell.h"

@interface JLHomeVC ()<UITableViewDelegate,UITableViewDataSource,JLDataHandlerProtocol>

//列表
@property(nonatomic,strong)UITableView *mainTableV;
//数据源
@property(nonatomic,strong)NSMutableArray *listArr;

@end

@implementation JLHomeVC

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
-(void)requestData{
    [[[JLHomeAPI getHomeList] netWorkClient] getRequestInView:self.view networkCodeTypeSuccessDataHandler:self isCache:NO];
}

-(void)netWorkCodeSuccessDealWithResponseObject:(id)responseObject{
    [self.mainTableV.mj_header endRefreshing];
    [self.mainTableV.mj_footer endRefreshing];
    if ([responseObject isKindOfClass:[JLHomeAPI class]]) {
        
        JLHomeAPI *api = responseObject;
        
        self.listArr = [NSMutableArray array];
        
        [self.listArr addObjectsFromArray:api.lives];
        
        [self.mainTableV reloadData];
    }
}

-(void)netWorkCodeFailureDealWithResponseObject:(id)responseObject{
    CLog(@"%@",responseObject);
    [self.mainTableV.mj_header endRefreshing];
    [self.mainTableV.mj_footer endRefreshing];
}

#pragma mark - ################################# 代理方法 ################################
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 350;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LivesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LivesCell"];
    Lives *live = self.listArr[indexPath.section];
    [cell fillLivesCellData:live];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[JLDetailVC new] animated:YES];

}

//cell出现动画
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    NSArray *array =  tableView.indexPathsForVisibleRows;
//    
//    NSIndexPath *firstIndexPath = array[0];
//    
//    NSLog(@"fdasf---%ld---%lu",(long)firstIndexPath.row,(unsigned long)array.count);
//    
//    //设置anchorPoint
//    
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//    
//    //为了防止cell视图移动，重新把cell放回原来的位置
//    
//    cell.layer.position = CGPointMake(0, cell.layer.position.y);
//    
//    
//    
//    //设置cell 按照z轴旋转90度，注意是弧度
//    
//    if (firstIndexPath.row < indexPath.row) {
//        
//        cell.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 0, 1.0);
//        
//    }else{
//        
//        cell.layer.transform = CATransform3DMakeRotation(- M_PI_2, 0, 0, 1.0);
//        
//    }
//    
//    
//    
//    cell.alpha = 0.0;
//    
//    
//    
//    [UIView animateWithDuration:1 animations:^{
//        
//        cell.layer.transform = CATransform3DIdentity;
//        
//        cell.alpha = 1.0;
//        
//    }];
    
    
    
    
    
//        cell.alpha = 0.5;
//    
//    
//    
//        CGAffineTransform transformScale = CGAffineTransformMakeScale(0.3,0.8);
//    
//        CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0.5, 0.6);
//    
//    
//    
//        cell.transform = CGAffineTransformConcat(transformScale, transformTranslate);
//    
//    
//    
//        [tableView bringSubviewToFront:cell];
//    
//        [UIView animateWithDuration:.4f
//    
//                              delay:0
//    
//                            options:UIViewAnimationOptionAllowUserInteraction
//    
//                         animations:^{
//    
//    
//    
//                             cell.alpha = 1;
//    
//                             //清空 transform
//    
//                             cell.transform = CGAffineTransformIdentity;
//    
//    
//    
//                         } completion:nil];
    
    
    
    
    
//        CATransform3D rotation;//3D旋转
//    
//            rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
//    
//            //逆时针旋转
//    
//            rotation.m34 = 1.0/ -600;
//    
//    
//    
//            cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    
//            cell.layer.shadowOffset = CGSizeMake(10, 10);
//    
//            cell.alpha = 0;
//    
//    
//    
//            cell.layer.transform = rotation;
//    
//    
//    
//            [UIView beginAnimations:@"rotation" context:NULL];
//    
//            //旋转时间
//    
//            [UIView setAnimationDuration:0.8];
//    
//            cell.layer.transform = CATransform3DIdentity;
//    
//            cell.alpha = 1;
//    
//            cell.layer.shadowOffset = CGSizeMake(0, 0);
//    
//            [UIView commitAnimations];
    
    
    
    
    // 从锚点位置出发，逆时针绕 Y 和 Z 坐标轴旋转90度
    
    CATransform3D transform3D = CATransform3DMakeRotation(M_PI_2, 0.0, 1.0, 1.0);
    // 定义 cell 的初始状态
    
    cell.alpha = 0.0;
    
    cell.layer.transform = transform3D;
    
    cell.layer.anchorPoint = CGPointMake(0.0, 0.5); // 设置锚点位置；默认为中心点(0.5, 0.5)
    
    // 定义 cell 的最终状态，执行动画效果
    // 方式一：普通操作设置动画
    
    [UIView beginAnimations:@"transform" context:NULL];
    
    [UIView setAnimationDuration:0.5];
    
    cell.alpha = 1.0;
    
    cell.layer.transform = CATransform3DIdentity;
    
    CGRect rect = cell.frame;
    
    rect.origin.x = 0.0;
    
    cell.frame = rect;
    
    [UIView commitAnimations];
    
}

#pragma mark - ################################# 事件处理 ################################

#pragma mark - ################################# 声明的成员方法和类方法 #####################

#pragma mark - ################################# 私有方法 ################################

/**
 初始化UI
 */
- (void)setUI{
    [self.view addSubview:self.mainTableV];
    
    [self setupRefresh];
}

/**
 初始化数据
 */
- (void)setData{
    
}

/**
 上下拉刷新
 */
- (void)setupRefresh {
    
    //下拉刷新 在开始刷新后会调用此block
    self.mainTableV.mj_header = [JLRefreshGifHeader headerWithRefreshingBlock:^{
        //网络请求数据
        [self requestData];
        
    }];
    
    self.mainTableV.mj_footer = [JLRefreshGifFoot footerWithRefreshingBlock:^{
        [self.mainTableV.mj_footer endRefreshingWithNoMoreData];
    }];
    
}


#pragma mark - ################################ 访问器方法 ################################
-(UITableView *)mainTableV{
    if (_mainTableV == nil) {
        _mainTableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) style:(UITableViewStyleGrouped)];
        _mainTableV.delegate   = self;
        _mainTableV.dataSource = self;
        [_mainTableV registerNib:[UINib nibWithNibName:@"LivesCell" bundle:nil] forCellReuseIdentifier:@"LivesCell"];
    }
    return _mainTableV;
}
@end
