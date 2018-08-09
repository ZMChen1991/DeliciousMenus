//
//  DMSearchController.m
//  DeliciousMenus
//
//  Created by lm on 2017/6/14.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import "DMSearchController.h"
#import "DMSearchCell.h"
#import "DMsearchBar.h"
#import "DMHomeViewController.h"
#import "DMTableViewController.h"

@interface DMSearchController ()

@property (nonatomic, strong) DMsearchBar *searchBar;

@end

@implementation DMSearchController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setupNav {

    _searchBar = [DMsearchBar searchBar];
    _searchBar.frame = CGRectMake(0, 0, 200, 30);
    self.navigationItem.titleView = _searchBar;
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
}

- (void)search {

    if (![self.searchBar.text isEqualToString:@""]) {
        NSLog(@"点击了搜索按钮:%@", self.searchBar.text);
    } else {
        NSLog(@"搜索为空");
    }
    
    self.searchBar.text = @"";
    
    DMHomeViewController *homeVC = [[DMHomeViewController alloc] init];
    [self.navigationController pushViewController:homeVC animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

#pragma mark 循环利用cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DMSearchCell *cell = [DMSearchCell cellWithTableView:tableView];
    cell.height = 100;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    DMTableViewController *testVC = [[DMTableViewController alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 100;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

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

@end
