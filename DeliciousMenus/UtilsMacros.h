//
//  UtilsMacros.h
//  DeliciousMenus
//
//  Created by lm on 2017/6/8.
//  Copyright © 2017年 CocaCola. All rights reserved.
//


// ------------- 系统属性 ----------------
// 获取系统对象
#define DMApplication [UIApplication sharedApplication]
#define DMApplicationDelegate [AppDelegate shareAppDelegate]
#define DMApplicationWindow [UIApplication sharedApplication].delegate.window

// 获取屏幕宽高
#define DMScreenWidth [[UIScreen mainScreen] bounds].size.width
#define DMScreenHight [[UIScreen mainScreen] bounds].size.height

// 当前系统版本
#define CurrentSystemVersion [[UIDevice currentDevice].systemVersion doubleValue]

// 当前系统语言
#define CurrentSystemLanguage (NSLocale preferredLanguages] objectAtIndex:0])



// ------------- 其他 ----------------
// 强弱引用
#define DMWeakSelf(type) __weak typeof(type) weak##type = type;
#define DMStrongSelf(type) __strong typeof(type) type = weak##type;

// IOS 版本判断
#define IOSAVAILABLEVERSION(version) ([[UIDevice currentDevice] availableVersion:version] < 0)

// RGB颜色
#define DMColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define DMRandomColor DMColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

// 全局背景色
#define DMGlobalBg DMColor(211, 211, 211)

// ------------- 通知 ----------------

#ifdef __OBJC__

#ifdef DEBUG // 处于开发阶段
#define DMLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define DMLog(...)
#endif


/*-----------    ----------- */


#endif


