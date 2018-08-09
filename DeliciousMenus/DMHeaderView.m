//
//  DMHeaderView.m
//  DeliciousMenus
//
//  Created by lm on 2017/7/6.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import "DMHeaderView.h"

@interface DMHeaderView ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *subTitleLabel;

@property (nonatomic, strong) UIButton *collectBtn;

@end

// 大概宽为270左右

@implementation DMHeaderView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = DMColor(98, 165, 256);
        [self setupView];
        
    }
    return self;
}

- (void)setupView {

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor yellowColor];
    [self addSubview:imageView];
    _imageView = imageView;
    
    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.textAlignment = NSTextAlignmentCenter;
//    titleLable.backgroundColor = [UIColor redColor];
    titleLable.font = [UIFont systemFontOfSize:20];
    [titleLable setText:@"宫保鸡丁"];
    [self addSubview:titleLable];
    _titleLabel = titleLable;
    
    UILabel *subTitleLable = [[UILabel alloc] init];
    subTitleLable.textAlignment = NSTextAlignmentCenter;
//    subTitleLable.backgroundColor = [UIColor redColor];
    subTitleLable.font = [UIFont systemFontOfSize:12];
    subTitleLable.text = [NSString stringWithFormat:@"10000浏览/352收藏"];
    [self addSubview:subTitleLable];
    _subTitleLabel = subTitleLable;
    
    UIButton *collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collectBtn.layer.cornerRadius = 5.0;
    [collectBtn setTitle:@"收藏" forState:UIControlStateNormal];
    [collectBtn setBackgroundColor:[UIColor orangeColor]];
    [collectBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:collectBtn];
    _collectBtn = collectBtn;
}


- (void)layoutSubviews {

    CGFloat imageViewW = self.frame.size.width;
    CGFloat imageViewH = imageViewW / 3 + 50;
    _imageView.frame = CGRectMake(0, 0, imageViewW, imageViewH);
    
    _titleLabel.bounds = CGRectMake(0, 0, imageViewW, 30);
    _titleLabel.center = CGPointMake(imageViewW / 2, CGRectGetMaxY(_imageView.frame) + 30);
    NSLog(@"%@", _titleLabel);
    
    _subTitleLabel.frame = CGRectMake(0, CGRectGetMaxY(_titleLabel.frame), imageViewW, 10);

    _collectBtn.bounds = CGRectMake(0, 0, imageViewW / 3, 30);
    _collectBtn.center = CGPointMake(imageViewW / 2, CGRectGetMaxY(_subTitleLabel.frame) + 30);
}

- (void)setData:(NSData *)data {

    
}

#pragma mark - private
- (void)btnClick {
    NSLog(@"点击了收藏按钮...");
}

@end
