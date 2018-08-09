//
//  DMNormalViewCell.m
//  DeliciousMenus
//
//  Created by lm on 2017/6/10.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import "DMNormalViewCell.h"

@interface DMNormalViewCell ()

// 图片
@property (nonatomic, strong) UIImageView *imageView;
// 名称
@property (nonatomic, strong) UILabel *nameLabel;
// 浏览量
@property (nonatomic, strong) UILabel *browseLabel;
// 收藏量
@property (nonatomic, strong) UILabel *collectLabel;

@end

@implementation DMNormalViewCell

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5.0;
        [self.layer setMasksToBounds:YES];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *browseLabel = [[UILabel alloc] init];
    browseLabel.textColor = [UIColor grayColor];
    browseLabel.textAlignment = NSTextAlignmentLeft;
    browseLabel.font = [UIFont systemFontOfSize:8];
    browseLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:browseLabel];
    self.browseLabel = browseLabel;
    
    UILabel *collectLabel = [[UILabel alloc] init];
    collectLabel.textColor = [UIColor grayColor];
    collectLabel.textAlignment = NSTextAlignmentLeft;
    collectLabel.font = [UIFont systemFontOfSize:8];
    collectLabel.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:collectLabel];
    self.collectLabel = collectLabel;
}

- (void)layoutSubviews {

    CGFloat imageView_w = self.frame.size.width;
    CGFloat imageView_h = self.frame.size.height - self.frame.size.height / 3;
    CGRect imageViewRect = CGRectMake(0, 0, imageView_w, imageView_h);
    self.imageView.frame = imageViewRect;
    
    CGFloat nameLabel_y = CGRectGetMaxY(self.imageView.frame);
    CGFloat nameLabel_w = self.frame.size.width;
    CGFloat nameLabel_h = (self.frame.size.height - nameLabel_y) / 3 * 2;
    CGRect nameLabelRect = CGRectMake(0, nameLabel_y, nameLabel_w, nameLabel_h);
    self.nameLabel.frame = nameLabelRect;

    CGFloat label_y = CGRectGetMaxY(self.nameLabel.frame);
    CGFloat label_w = self.frame.size.width / 2;
    CGFloat label_h = self.frame.size.height - CGRectGetMaxY(self.nameLabel.frame);
    CGRect browseLabelRect = CGRectMake(0, label_y, label_w, label_h);
    self.browseLabel.frame = browseLabelRect;

    CGRect collectLabelRect = CGRectMake(label_w, label_y, label_w, label_h);
    self.collectLabel.frame = collectLabelRect;
}

- (void)setData:(NSData *)data {

//    self.imageView.image = [UIImage imageNamed:data];
    self.nameLabel.text = [NSString stringWithFormat:@"酸菜鱼"];
    self.browseLabel.text = [NSString stringWithFormat:@"浏览量:1000"];
    self.collectLabel.text = [NSString stringWithFormat:@"收藏量:200"];;
}

@end
