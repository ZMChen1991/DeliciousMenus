//
//  DMRequest.m
//  DeliciousMenus
//
//  Created by lm on 2017/6/13.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import "DMRequest.h"
#import "AFNetworking.h"

@interface DMRequest ()

@end

@implementation DMRequest

+ (void)reachabilityStatus {

    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager manager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"自带网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                break;
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            default:
                break;
        }
    }];
    // 开始监控
    [manager startMonitoring];
}


+ (void)GET:(NSString *)URL parameters:(id)parameters responseCache:(DMHTTPRequestCache)requestCache success:(DMHTTPRequestSuccess)success failed:(DMHTTPRequestFailed)failed {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"-----%@", dict);
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failed) {
            failed(error);
        }
    }];
}

+ (void)POST:(NSString *)URL parameters:(id)parameters responseCache:(DMHTTPRequestCache)requestCache success:(DMHTTPRequestSuccess)success failed:(DMHTTPRequestFailed)failed {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:URL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failed) {
            failed(error);
        }
    }];
}

@end
