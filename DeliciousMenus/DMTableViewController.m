//
//  DMTableViewController.m
//  DeliciousMenus
//
//  Created by lm on 2017/6/10.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import "DMTableViewController.h"
#import "PictureRotate.h"
#import "DMHeaderView.h"

@interface DMTableViewController ()

@property (nonatomic, strong) PictureRotate *rotate;

//@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DMTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 164, DMScreenWidth, DMScreenHight-164)];
//    self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
//    self.tableView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:_tableView];
//    [self addRotateView];
    
    [self addHeaderView];
}

- (void)addRotateView {
    
    PictureRotate *rotate = [[PictureRotate alloc] initWithFrame:CGRectMake(0, -100, DMScreenWidth, 100)];
    rotate.backgroundColor = DMColor(120, 120, 120);
    rotate.images = nil;
    rotate.timeInterval = 1;
    [self.view addSubview:rotate];
    self.rotate = rotate;
//    NSLog(@"%@",self.rotate);
}

- (void)addHeaderView {
    
    DMHeaderView *header = [[DMHeaderView alloc] initWithFrame:CGRectMake(0, 0, DMScreenWidth, 270)];
    
    self.tableView.tableHeaderView = header;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

#pragma mark -懒加载
//- (UITableView *)tableView {
//
//    if (!_tableView) {
//        
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, DMScreenWidth, DMScreenHight-164)];
////        self.tableView.tableFooterView = [[UIView alloc] init];
//    }
//    return _tableView;
//}

@end
