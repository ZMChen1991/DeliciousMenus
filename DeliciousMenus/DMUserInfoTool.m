//
//  DMUserInfoTool.m
//  DeliciousMenus
//
//  Created by lm on 2017/6/14.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#define DMUserInfoPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"userInfo.archive"]

#import "DMUserInfoTool.h"

@implementation DMUserInfoTool

+ (void)saveUserInfo:(DMUserInfo *)userInfo {
    
    // 自定义对象的存储必须用NSKeyedArchiver，不再有什么writeToFile方法
    [NSKeyedArchiver archiveRootObject:userInfo toFile:DMUserInfoPath];
}


+ (DMUserInfo *)userInfo {

    DMUserInfo *userInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:DMUserInfoPath];
    
    return userInfo;
}

@end
