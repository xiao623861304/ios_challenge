//
//  YF_WebImageCache.m
//  showImageList
//
//  Created by yan feng on 2019/6/1.
//  Copyright © 2019 Yan feng. All rights reserved.
//

#import "YF_WebImageCache.h"
#import <UIKit/UIKit.h>


@interface YF_WebImageCache()
//@property(strong , nonatomic)NSFileManager *fileManager;
@end
@implementation YF_WebImageCache

+ (NSData *)readCacheFromImageID:(NSString *)imageId isThumbnailUrl:(BOOL)isThumbnailUrl{
    NSData * data ;
    NSString *path = [YF_WebImageCache getFullCachePathFromImageID:imageId isThumbnailUrl:isThumbnailUrl];
//    NSLog(@"----%@",path);
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        data = [NSData dataWithContentsOfFile:path];
    }
    return data;
}
+(void)writeCacheToImageID:(NSString *)imageId withData:(NSData *)data isThumbnailUrl:(BOOL)isThumbnailUrl{
    NSString *path = [YF_WebImageCache getFullCachePathFromImageID:imageId isThumbnailUrl:isThumbnailUrl];
//    [data writeToFile:path atomically:true];
    NSLog(@"%@", [data writeToFile:path atomically:true]?@"writeSuccess":@"writeFail");
}
+(NSString *)getFullCachePathFromImageID:(NSString *)imageId isThumbnailUrl:(BOOL)isThumbnailUrl{
    NSString *cachePath = @"";
    if (isThumbnailUrl) {
       cachePath = [NSHomeDirectory() stringByAppendingString:@"/Library/Caches/MyCache/ThumbnailUrl" ];
    }else{
       cachePath = [NSHomeDirectory() stringByAppendingString:@"/Library/Caches/MyCache/imageURL" ];
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:cachePath]) {
        [fileManager createDirectoryAtPath:cachePath withIntermediateDirectories:true attributes:nil error:  nil];
    }
    cachePath = [cachePath stringByAppendingFormat:@"/%@",imageId];
    NSLog(@"---%@",cachePath);
    return cachePath;
}
+(void)removeAllCache{
    NSString *cachePath = [NSHomeDirectory() stringByAppendingString:@"/Library/Caches/MyCache" ];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:cachePath]) {
        [fileManager removeItemAtPath:cachePath error:nil];
    }
}
+(NSString *)stringToYFString:(NSString *)str{
    NSMutableString *newStr = [[NSMutableString alloc]init];
    for (int i=0; i<str.length; i++) {
        unichar c = [str characterAtIndex:i];
        if ((c>=48&&c<57)||(c>=65&&c<90)||(c>97&&c<122)) {
            [newStr appendFormat:@"%c",c];
        }
    }
    return [newStr copy];
}

@end
