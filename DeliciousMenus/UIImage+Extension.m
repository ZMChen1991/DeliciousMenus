//
//  UIImage+Extension.m
//  DeliciousMenus
//
//  Created by lm on 2017/6/14.
//  Copyright © 2017年 CocaCola. All rights reserved.
//

#import "UIImage+Extension.h"
#import <AVFoundation/AVAsset.h>
#import <AVFoundation/AVAssetImageGenerator.h>

@implementation UIImage (Extension)

+ (UIImage *)fetchThumbnailWithPath:(NSString *)path {

    AVURLAsset *asset = [[AVURLAsset alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"file://%@",path]] options:nil];
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    gen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.f, 600.f);
    CMTime actualTime;
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:nil];
    UIImage *thumb = [[UIImage alloc]initWithCGImage:image];
    CGImageRelease(image);
    
    return thumb;
}

@end
