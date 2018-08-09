//
//  DMUserInfoTool.h
//  DeliciousMenus
//
//  Created by lm on 2017/6/14.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMUserInfo.h"

@interface DMUserInfoTool : NSObject


// 存储用户信息
+ (void)saveUserInfo:(DMUserInfo *)userInfo;

// 返回用户信息
+ (DMUserInfo *)userInfo;


@end
