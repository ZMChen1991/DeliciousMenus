//
//  DMUserInfo.h
//  DeliciousMenus
//
//  Created by lm on 2017/6/13.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMUserInfo : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *password;


- (instancetype)initWithDic:(NSDictionary *)dict;

@end
