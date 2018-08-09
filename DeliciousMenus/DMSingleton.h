//
//  DMSingleton.h
//  DeliciousMenus
//
//  Created by lm on 2017/6/8.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#ifndef DMSingleton_h
#define DMSingleton_h

// .h文件
#define DMSingletonH + (instancetype)sharedInstance;

// .m文件
#define DMSingletonM \
static id _instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}


#endif /* DMSingleton_h */
