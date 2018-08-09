//
//  DMTabBarController.m
//  DeliciousMenus
//
//  Created by lm on 2017/6/8.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import "DMTabBarController.h"
#import "DMNavigationController.h"
#import "DMHomeViewController.h"
#import "DMTableViewController.h"
#import "DMSearchController.h"
#import "DMTestViewController.h"

@interface DMTabBarController ()

@end

@implementation DMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    DMHomeViewController *home = [[DMHomeViewController alloc] init];
    [self addChildViewController:home title:@"首页" image:nil selectImage:nil];
    
    DMTableViewController *home1 = [[DMTableViewController alloc] init];
    [self addChildViewController:home1 title:@"首页1" image:nil selectImage:nil];
    
    DMTestViewController *home2 = [[DMTestViewController alloc] init];
    [self addChildViewController:home2 title:@"测试" image:nil selectImage:nil];
    
    DMSearchController *search = [[DMSearchController alloc] init];
    [self addChildViewController:search title:@"搜索" image:nil selectImage:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage {

    childController.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:image];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    DMNavigationController *nav = [[DMNavigationController alloc] initWithRootViewController:childController];
    // 在此修改tabBarItem的文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [nav.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [nav.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    [self addChildViewController:nav];
}


@end
