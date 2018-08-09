//
//  DMsearchBar.m
//  DeliciousMenus
//
//  Created by lm on 2017/6/15.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import "DMsearchBar.h"

@implementation DMsearchBar

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:13];
        self.placeholder = @"想吃什么就在这里搜索";
//        self.background = [[UIImage imageNamed:@"searchbar_textfield_background"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 0.5, 1, 0.5) resizingMode:UIImageResizingModeStretch];
        self.background = [[UIImage imageNamed:@"searchbar_textfield_background"] stretchableImageWithLeftCapWidth:3 topCapHeight:3];
        
        UIImageView *searchIcon = [[UIImageView alloc] init];
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.contentMode = UIViewContentModeCenter;
        // 宽、高
        searchIcon.width = 30;
        searchIcon.height = 30;
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

+ (instancetype)searchBar {

    return [[self alloc] init];
}

@end
