//
//  DMUserManager.h
//  DeliciousMenus
//
//  Created by lm on 2017/6/13.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMUserInfo.h"

typedef NS_ENUM(NSInteger, DMUserLoginStatus) {
    DMUserLoginStatusThird = 0x01 << 0, // 第三方登录
    DMUserLoginStatusPassword = 0x01 << 1  // 密码登录
};

@interface DMUserManager : NSObject

DMSingletonH; // 单例


@property (nonatomic, assign) DMUserLoginStatus userLoginStatus; // 登录方式
@property (nonatomic, strong) DMUserInfo *userInfo; // 用户信息
@property (nonatomic, assign) BOOL islogined; // 是否登录


@end
