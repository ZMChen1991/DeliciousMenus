//
//  DMMianCell.m
//  DeliciousMenus
//
//  Created by lm on 2017/7/7.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import "DMMianCell.h"

@interface DMMianCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation DMMianCell

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setupUI {

    UILabel *titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:titleLabel];
    _titleLabel = titleLabel;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    _imageView = imageView;
}

- (void)layoutSubviews {

    
}

- (void)setData {

    self.titleLabel.text = [NSString stringWithFormat:@"就该这么做。。。"];
#warning 这里需要优化。。。
    self.imageView.image = [UIImage imageNamed:@""];
}

@end
