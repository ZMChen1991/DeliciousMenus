//
//  DMHomeViewController.m
//  DeliciousMenus
//
//  Created by lm on 2017/6/8.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#warning 目前来说还需要修改以下几项
/**
    1.屏幕适配，有几处地方显示不合理
    2.数据源（迟些自己编写）
    3.联动表（物品分类、食品分类）
    4.
 
 */

#import "DMHomeViewController.h"
#import "PictureRotate.h"
#import "DMNormalViewCell.h"
#import "DMRefreshNormalHeader.h"
#import "DMRefreshAutoNormalFooter.h"
#import "DMTableViewController.h"
#import "DMSearchController.h"
#import "DMNormalModel.h"
#import "DMRequest.h"
#import "AFNetworking.h"

@interface DMHomeViewController () < UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) UIView *rotateView;

// 数据
// 转播图数组
@property (nonatomic, strong) NSMutableArray<NSString *> *rotateArray;
// 精品好菜
@property (nonatomic, strong) NSMutableArray<DMNormalModel *> *menuArray;



@end

static NSString *const cellID = @"cellID";
static NSString *const headerID = @"headerID";
static NSString *const footerID = @"footerID";

static NSString *const DMAPPKEY = @"fd9d3f176feca12f6320a5272bab14a0";


@implementation DMHomeViewController

// 重写init方法
- (instancetype)init {
    
    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;// 水平
    return [self initWithCollectionViewLayout:_flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化数据
    self.rotateArray = [NSMutableArray arrayWithObjects:@"http://images.meishij.net/p/20170907/e401d50d49b01a0780c9f7333574b58b.jpg", @"http://images.meishij.net/p/20170907/da7a393f3270b5896f69ff13fcdaa34d.jpg", nil];

    [self config];
    [self registerCell];
    [self loadData];
    
}

- (void)addRotateView {

    PictureRotate *rotate = [[PictureRotate alloc] initWithFrame:CGRectMake(0, 0, DMScreenWidth, 150)];
    rotate.backgroundColor = DMRandomColor;
    
    rotate.images = self.rotateArray;
    rotate.timeInterval = 1;
    [self.rotateView addSubview:rotate];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(60, CGRectGetMaxY(rotate.frame) + 10, DMScreenWidth - 120, 30);
//    searchBtn.backgroundColor = [UIColor yellowColor];
    [searchBtn setTitle:@"想吃什么搜这里，如：家常菜" forState:UIControlStateNormal];
    [searchBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [searchBtn setImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"] forState:UIControlStateNormal];
    [searchBtn setBackgroundImage:[[UIImage imageNamed:@"searchbar_textfield_background"] stretchableImageWithLeftCapWidth:3 topCapHeight:3] forState:UIControlStateNormal];
    searchBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    searchBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [searchBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.rotateView addSubview:searchBtn];
    
    self.rotateView.frame = CGRectMake(0, 0, DMScreenWidth, CGRectGetMaxY(searchBtn.frame));
}

- (void)btnClick {
    NSLog(@"点击了searchBtn");
    
    DMSearchController *searchVC = [[DMSearchController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

- (void)config {

    [self addRotateView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.collectionView.backgroundColor = DMColor(246, 246, 246);
    self.collectionView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);// 设置collectionView的位置
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    DMRefreshNormalHeader *header = [DMRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header.automaticallyChangeAlpha = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在为您刷新，请稍等片刻" forState:MJRefreshStateRefreshing];
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    header.stateLabel.textColor = [UIColor darkGrayColor];
    [header beginRefreshing];
    self.collectionView.mj_header = header;
    
//    DMRefreshAutoNormalFooter *footer = [DMRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    footer.automaticallyChangeAlpha = YES;
//    [footer setTitle:@"上拉刷新" forState:MJRefreshStateIdle];
//    [footer setTitle:@"松开刷新" forState:MJRefreshStatePulling];
//    [footer setTitle:@"正在为您刷新，请稍等片刻" forState:MJRefreshStateRefreshing];
//    footer.stateLabel.font = [UIFont systemFontOfSize:15];
//    footer.stateLabel.textColor = [UIColor darkGrayColor];
//    self.collectionView.mj_footer = footer;
}

- (void)registerCell {

    [self.collectionView registerClass:[DMNormalViewCell class] forCellWithReuseIdentifier:cellID];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerID];
}

#pragma mark 加载数据
- (void)loadData {

    NSLog(@"加载数据...");
    
    
}

- (void)loadNewData {

    NSLog(@"加载新的数据...");
    [self.collectionView.mj_header endRefreshing];
}

- (void)loadMoreData {

    
    NSLog(@"加载更多数据...");
    [self.collectionView.mj_footer endRefreshing];
}



#pragma mark - UICollectionViewDelegateFlowLayout
// 个人认为：cell的Size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((320-20)/3, 150);
}

/*
    个人认为：同section中纵向的两个Item的间距
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {

    return 5;
}

/*
    个人认为：同section中横向的两个Item的间距
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

// 个人认为：collectionView的边距 -- 上、左、下、右
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(5, 5, 5, 5);// 上.左.下.右
}

// sectionHeader、 sectionFooter
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *headerView;
    if (indexPath.section == 0) {
        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerID forIndexPath:indexPath];
        if (headerView == nil) {
            headerView = [[UICollectionReusableView alloc] init];
        }
        [headerView addSubview:self.rotateView];
    }else {
        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerID forIndexPath:indexPath];
        if (headerView == nil) {
            headerView = [[UICollectionReusableView alloc] init];
        }
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
        [titleLabel setText:@"精品推荐"];
        [titleLabel setFont:[UIFont systemFontOfSize:13]];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = DMColor(163, 220, 115);
        [headerView addSubview:titleLabel];
//        headerView.backgroundColor = DMColor(163, 220, 115);
    }
    return headerView;
    
    
    //    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
    //        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerID forIndexPath:indexPath];
    //        if (headerView == nil) {
    //            headerView = [[UICollectionReusableView alloc] init];
    //        }
    //        headerView.backgroundColor = [UIColor redColor];
    //        [headerView addSubview:self.rotate];
    //        return headerView;
    //    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
    //        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerID forIndexPath:indexPath];
    //        if (footerView == nil) {
    //            footerView = [[UICollectionReusableView alloc] init];
    //        }
    //        footerView.backgroundColor = [UIColor grayColor];
    //        return footerView;
    //    }
    //    return nil;
}

// sectionFooter的Size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//    return CGSizeMake(DMScreenWidth, 11);
//}

// sectionHeader的Size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    CGSize size = CGSizeZero;
    if (section == 0) {
        size = CGSizeMake(DMScreenWidth, CGRectGetMaxY(self.rotateView.frame));
    } else {
        size = CGSizeMake(DMScreenWidth, 30);
    }
    return size;
}

#pragma mark - UICollectionViewDelegate、UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if (section == 0) {
        return 0;
    } else {
        return 11;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DMNormalViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    cell.data = nil;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"点击了第%ld个cell", indexPath.row);
    DMTableViewController *vc = [[DMTableViewController alloc] init];
//    [self presentViewController:vc animated:YES completion:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
}

// 旋转
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    CATransform3D rotation;//3D旋转
    //    rotation = CATransform3DMakeTranslation(0 ,50 ,20);
    rotation = CATransform3DMakeRotation( M_PI_4 , 0.0, 0.7, 0.4);
    //逆时针旋转
    
    rotation = CATransform3DScale(rotation, 0.8, 0.8, 1);
    
    rotation.m34 = 1.0/ 1000;
    
    cell.layer.shadowColor = [[UIColor redColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    
    [UIView beginAnimations:@"rotation" context:NULL];
    //旋转时间
    [UIView setAnimationDuration:0.6];
    
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
    
}

#pragma mark - 懒加载
- (UIView *)rotateView {

    if (!_rotateView) {
        _rotateView = [[UIView alloc] init];
    }
    return _rotateView;
}

@end
