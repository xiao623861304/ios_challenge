//
//  YF_WebImageCache.h
//  showImageList
//
//  Created by yan feng on 2019/6/1.
//  Copyright © 2019 Yan feng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YF_WebImageCache : NSObject
+ (NSData *)readCacheFromImageID:(NSString *)imageId isThumbnailUrl:(BOOL)isThumbnailUrl;
+(void)writeCacheToImageID:(NSString *)imageId withData:(NSData *)data isThumbnailUrl:(BOOL)isThumbnailUrl;
+(void)removeAllCache;
@end

NS_ASSUME_NONNULL_END
