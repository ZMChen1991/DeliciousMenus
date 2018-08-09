//
//  DMSearchCell.m
//  DeliciousMenus
//
//  Created by lm on 2017/6/14.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import "DMSearchCell.h"

#define DMCELLMARGIN 5
#define DMCELLHEIGHT self.frame.size.height
#define DMCELLWIDTH self.frame.size.width

@interface DMSearchCell ()

@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *nameL;
@property (nonatomic, strong) UILabel *subNameL;
@property (nonatomic, strong) UILabel *favoriteL;
@property (nonatomic, strong) UILabel *collectionL;

@property (nonatomic, strong) UIView *cellground;

@end

@implementation DMSearchCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {

    static NSString *ID = @"search";
    DMSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[DMSearchCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = DMColor(246, 246, 246);
        
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    
    UIView *cellground = [[UIView alloc] init];
    cellground.backgroundColor = [UIColor whiteColor];
    cellground.layer.cornerRadius = 5.0;
    [cellground.layer setMasksToBounds:YES];
    [self.contentView addSubview:cellground];
    self.cellground = cellground;
    
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.backgroundColor = [UIColor redColor];
    imageV.layer.cornerRadius = 5.0;
    [imageV.layer setMasksToBounds:YES];
    [self.cellground addSubview:imageV];
    self.imageV = imageV;
    
    UILabel *nameL = [[UILabel alloc] init];
//    nameL.backgroundColor = [UIColor blueColor];
    nameL.text = @"麻婆豆腐";
    nameL.font = [UIFont systemFontOfSize:17];
    [self.cellground addSubview:nameL];
    self.nameL = nameL;
    
    UILabel *subNameL = [[UILabel alloc] init];
//    subNameL.backgroundColor = [UIColor greenColor];
    subNameL.text = @"瘦肉、豆腐、麻椒、辣椒、蒜、葱";
    subNameL.font = [UIFont systemFontOfSize:13];
    [self.cellground addSubview:subNameL];
    self.subNameL = subNameL;
    
    UILabel *favoriteL = [[UILabel alloc] init];
//    favoriteL.backgroundColor = [UIColor grayColor];
    favoriteL.text = @"23412浏览";
    favoriteL.font = [UIFont systemFontOfSize:10];
    [self.cellground addSubview:favoriteL];
    self.favoriteL = favoriteL;
    
    UILabel *collectionL = [[UILabel alloc] init];
//    collectionL.backgroundColor = [UIColor yellowColor];
    collectionL.text = @"4102收藏";
    collectionL.font = [UIFont systemFontOfSize:10];
    [self.cellground addSubview:collectionL];
    self.collectionL = collectionL;
}

- (void)layoutSubviews {

    CGFloat cellgroundX = DMCELLMARGIN;
    CGFloat cellgroundY = DMCELLMARGIN;
    CGFloat cellgroundW = DMScreenWidth - 2 * DMCELLMARGIN;
    CGFloat cellgroundH = DMCELLHEIGHT - 2 * DMCELLMARGIN;
    self.cellground.frame = CGRectMake(cellgroundX, cellgroundY, cellgroundW, cellgroundH);
    
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageH = cellgroundH;
    CGFloat imageW = imageH;
    self.imageV.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat nameX = CGRectGetMaxX(self.imageV.frame) + DMCELLMARGIN;
    CGFloat nameY = 0;
    CGFloat nameW = cellgroundW - imageW - DMCELLMARGIN;
    CGFloat nameH = imageH / 2;
    self.nameL.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    CGFloat subNameX = nameX;
    CGFloat subNameY = CGRectGetMaxY(self.nameL.frame);
    CGFloat subNameW = nameW;
    CGFloat subNameH = nameH / 2;
    self.subNameL.frame = CGRectMake(subNameX, subNameY, subNameW, subNameH);
    
    CGFloat favoriteX = nameX;
    CGFloat favoriteY = CGRectGetMaxY(self.subNameL.frame);
    CGFloat favoriteW = subNameW / 2;
    CGFloat favoriteH = subNameH ;
    self.favoriteL.frame = CGRectMake(favoriteX, favoriteY, favoriteW, favoriteH);
    
    CGFloat collectionX = favoriteX + favoriteW;
    CGFloat collectionY = favoriteY;
    CGFloat collectionW = favoriteW;
    CGFloat collectionH = favoriteH;
    self.collectionL.frame = CGRectMake(collectionX, collectionY, collectionW, collectionH);
    
    // 没有cellground的位置描述
//    CGFloat imageX = DMCELLMARGIN;
//    CGFloat imageY = imageX;
//    CGFloat imageH = DMCELLHEIGHT - 2 * DMCELLMARGIN;
//    CGFloat imageW = imageH;
//    self.imageV.frame = CGRectMake(imageX, imageY, imageW, imageH);
//    
//    CGFloat nameX = CGRectGetMaxX(self.imageV.frame) + DMCELLMARGIN;
//    CGFloat nameY = DMCELLMARGIN;
//    CGFloat nameW = DMCELLWIDTH - imageH - 3 * DMCELLMARGIN;
//    CGFloat nameH = imageH / 2;
//    self.nameL.frame = CGRectMake(nameX, nameY, nameW, nameH);
//    
//    CGFloat subNameX = nameX;
//    CGFloat subNameY = CGRectGetMaxY(self.nameL.frame);
//    CGFloat subNameW = nameW;
//    CGFloat subNameH = nameH / 2;
//    self.subNameL.frame = CGRectMake(subNameX, subNameY, subNameW, subNameH);
//    
//    CGFloat favoriteX = nameX;
//    CGFloat favoriteY = CGRectGetMaxY(self.subNameL.frame);
//    CGFloat favoriteW = subNameW / 2;
//    CGFloat favoriteH = subNameH ;
//    self.favoriteL.frame = CGRectMake(favoriteX, favoriteY, favoriteW, favoriteH);
//    
//    CGFloat collectionX = favoriteX + favoriteW;
//    CGFloat collectionY = favoriteY;
//    CGFloat collectionW = favoriteW;
//    CGFloat collectionH = favoriteH;
//    self.collectionL.frame = CGRectMake(collectionX, collectionY, collectionW, collectionH);
}

@end
