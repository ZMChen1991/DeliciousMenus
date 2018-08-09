//
//  DMTestViewController.m
//  DeliciousMenus
//
//  Created by lm on 2017/6/15.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import "DMTestViewController.h"
#import "DMsearchBar.h"
#import "DMHeaderView.h"

@interface DMTestViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DMTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    DMsearchBar *searchBar = [DMsearchBar searchBar];
    searchBar.frame = CGRectMake(0, 64, 320, 30);
    [self.view addSubview:searchBar];
    
//    DMHeaderView *headerView = [[DMHeaderView alloc] initWithFrame:CGRectMake(0, 100, 320, 270)];
//    [self.view addSubview:headerView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(searchBar.frame), 320, DMScreenHight-30)];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 30;
}

#pragma mark 循环利用cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"Cell";
    // 1.拿到一个标识先去缓存池中查找对应的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 2.如果缓存池中没有，才需要传入一个标识创新的cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", indexPath.row];
    return cell;
}
@end
