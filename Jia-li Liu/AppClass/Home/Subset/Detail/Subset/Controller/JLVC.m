//
//  JLVC.m
//  MilkPo_User
//
//  Created by KLIANS on 16/6/4.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "JLVC.h"
#import "JLCell.h"

@interface JLVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *mainTbale;

@end

@implementation JLVC
@synthesize carousel;
@synthesize wrap;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        wrap = YES;
    }
    
    return self;
}
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
#pragma mark ----iCarouselDelegate--

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 10;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    UIImageView *view = [[UIImageView alloc]init];
    [view sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:JLGetImage(@"3")];
    view.frame = CGRectMake(0, 0, 100, 180);
    
    return view;
}

- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    return 0;
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    return 10;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return 200;
}

- (CATransform3D)carousel:(iCarousel *)_carousel transformForItemView:(UIView *)view withOffset:(CGFloat)offset
{
    view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0);
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = self.carousel.perspective;
    transform = CATransform3DRotate(transform, M_PI / 8.0, 0, 1.0, 0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset * carousel.itemWidth);
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    return wrap;
}

#pragma mark - UITableviewdelegate代理方法 -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 30;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *text = @"浙师大是金华市唯一一所大学，这个地位在金华人民心中不会比浙大在杭州人民心中差，独子嘛，总是要优待一点，首先从面积上体现出来——浙师大有3000多亩地！还有很多储备地没有造过，而且从金华建校到现在没有拆过。所以，这是浙江唯一一所历史气息浓厚的超大面积大学。";
    CGRect suggestedRect = [text boundingRectWithSize:CGSizeMake(ScreenWidth-20, MAXFLOAT) options:   NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:@{NSFontAttributeName:FONT(12)} context:nil];
    return suggestedRect.size.height+70;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JLCell *cell = [JLCell cellWithTableView:tableView];
    return cell;
}


#pragma mark - ################################# 事件处理 ################################

#pragma mark - ################################# 声明的成员方法和类方法 #####################

#pragma mark - ################################# 私有方法 ################################

/**
 初始化UI
 */
- (void)setUI{
    self.title = @"轮播";
    //标题颜色修改
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem.tintColor = kWhiteColor;
    
    UIImage *image = [UIImage new];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.view.backgroundColor = RGB(41, 40, 45);
    
    carousel = [[iCarousel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 300)];
    carousel.delegate = self;
    carousel.dataSource = self;
    carousel.type = iCarouselTypeCoverFlow;
    carousel.stringBlock = ^(NSString *index){
        NSLog(@"%@",index);
        
    };
    [carousel scrollToItemAtIndex:5 animated:NO];
    [self.view addSubview:carousel];
    
    [self.view addSubview:self.mainTbale];
    
    [self setupRefresh];
}

/**
 上下拉刷新
 */
- (void)setupRefresh {
    
    self.mainTbale.mj_footer = [JLRefreshGifFoot footerWithRefreshingBlock:^{
        [self.mainTbale.mj_footer endRefreshingWithNoMoreData];
    }];
    
}

/**
 初始化数据
 */
- (void)setData{
    
}


#pragma mark - ################################ 访问器方法 ################################
//状态栏颜色，当前页面不在导航控制器中，需重写preferredStatusBarStyle
-(UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent; //白色
    
}

-(UITableView *)mainTbale{
    if (_mainTbale == nil) {
        _mainTbale = [[UITableView alloc]initWithFrame:CGRectMake(0, carousel.frame.size.height, ScreenWidth, ScreenHeight-carousel.frame.size.height) style:(UITableViewStyleGrouped)];
        _mainTbale.delegate = self;
        _mainTbale.dataSource = self;
        [_mainTbale registerClass:[JLCell class] forCellReuseIdentifier:@"JLCell"];
        _mainTbale.estimatedRowHeight = 100;
        _mainTbale.rowHeight = UITableViewAutomaticDimension;
    }
    return _mainTbale;
}
@end
