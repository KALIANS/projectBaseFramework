//
//  JLNewFetureController.m
//  NewFeatureDemo
//
//  Created by KLIANS on 2016/10/11.
//  Copyright © 2016年 KLIANS. All rights reserved.
//

#import "JLNewFetureController.h"
#import "JLCollectionViewCell.h"

static NSString * const reuseIdentifier = @"CellIdentfifier";

@interface JLNewFetureController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *mArray;

@property (nonatomic, strong) UIViewController *homeViewController;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UICollectionView *collectionView;

//流水布局
@property (nonatomic, strong) UICollectionViewLayout *flowLayout;
/**按钮的位置0.87*/
@property (nonatomic, assign) CGFloat starHeightButton;
@property (nonatomic, assign) CGSize buttonSize;
@property (nonatomic, copy) NSString *buttonTitle;
@property (nonatomic, copy) NSString *buttonImage;
@property (nonatomic, strong) UIColor *titleColor;

@end

@implementation JLNewFetureController

- (NSMutableArray *)mArray
{
    if (!_mArray) {
        _mArray = @[].mutableCopy;
    }
    return _mArray;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.centerX = self.view.frame.size.width * 0.5;
        _pageControl.centerY = self.view.frame.size.height - 50;
        _pageControl.userInteractionEnabled = NO;
    }
    
    return _pageControl;
}

- (UIViewController *)homeViewController
{
    if (!_homeViewController) {
        _homeViewController = [[UIViewController alloc] init];
    }
    return _homeViewController;
}

- (UICollectionViewLayout *)flowLayout
{
    if (!_flowLayout) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        //设置cell的尺寸
        flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
        //清空行距
        flowLayout.minimumLineSpacing = 0;
        //设置滚动方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout = flowLayout;
        
    }
    
    return _flowLayout;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
#pragma mark -- 重新赋值
- (instancetype)initWithNSArray:(NSMutableArray *)array withButton:(JLExButton *)startButton withButtonHeight:(CGFloat)startHeight withViewController:(UIViewController *)controller
{
    if (self = [super init]) {
        self.mArray = array;
        self.starHeightButton = startHeight;
        self.homeViewController = controller;
    }
    
    return self;
}

- (instancetype)initWithNSArray:(NSMutableArray *)array withButtonSize:(CGSize)buttonSize withButtonTitle:(NSString *)buttonTitle withButtonImage:(NSString *)imageName withButtonTitleColor:(UIColor *)titleColor withButtonHeight:(CGFloat)startHeight withViewController:(UIViewController *)controller
{
    if (self = [super init]) {
        self.mArray = array;
        self.buttonSize = buttonSize;
        self.buttonImage = imageName;
        self.buttonTitle = buttonTitle;
        self.starHeightButton = startHeight;
        self.homeViewController = controller;
        self.titleColor = titleColor;
    }
    return self;
}

- (instancetype)initWithNSArray:(NSMutableArray *)array withButton:(JLExButton *)startButton
{
    if (self = [super init]) {
        self.mArray = array;
    }
    
    return self;
}
- (instancetype)initWithNSArray:(NSMutableArray *)array
{
    if (self = [super init]) {
        self.mArray = array;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //加载子视图
    [self initilizationSub];
    
}

- (void)initilizationSub
{
    [self.view addSubview:self.collectionView];
    self.collectionView.delegate = self;
    //注册cell
    [self.collectionView registerClass:[JLCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

    //分页显示
    self.collectionView.pagingEnabled = YES;
    //弹黄效果
    self.collectionView.bounces = NO;
    //不显示滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    //pageControl
    [self.view addSubview:self.pageControl];
    self.pageControl.numberOfPages = self.mArray.count;
}

#pragma mark -- UICollectionViewDataSource
//组数，可以不写默认为1
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每组有几个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.mArray.count;
}

//设置每个cell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //1.首先从缓冲池中取cell
    //2.检查当前是否注册cell,如果注册cell,就会帮你创建cell
    //3.如果没有注册，就注册
    JLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSIndexPath *indexPathStr = self.mArray[indexPath.row];
    
    NSString *imageName = [NSString stringWithFormat:@"%@",indexPathStr];
    cell.image = [UIImage imageNamed:imageName];
    cell.startHeight = self.starHeightButton;
    cell.toController = self.homeViewController;
    cell.imageNameStr = self.buttonImage;
    cell.startButton.XLJLable.text = self.buttonTitle;
    cell.startButton.XLJLable.textColor = self.titleColor;
    cell.startButton.size = self.buttonSize;
    
    //判断是否是最后一页
    [cell setCurrentPageIndex:indexPath.row lastPageIndex:self.mArray.count -1];

    return cell;
}

#pragma mark -- Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
}

@end



