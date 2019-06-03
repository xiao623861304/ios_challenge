//
//  UIImageView+YF_WebImage.m
//  showImageList
//
//  Created by yan feng on 2019/6/1.
//  Copyright © 2019 Yan feng. All rights reserved.
//

#import "UIImageView+YF_WebImage.h"
#import "YF_WebImageCache.h"

@implementation UIImageView (YF_WebImage)
-(void)setYF_WebImageWithUrl:(NSString *)url PlaceHolder:(NSString *)defaultImage ID:(NSString *)ImageId isthumbnailUrl:(BOOL)isThumbnailUrl{
    __block UIImage *yfImage;
    
    if (url == nil) {
        return;
    }
    if (defaultImage != nil) {
        self.image = [UIImage imageNamed:defaultImage];
    }
    NSData *data = [YF_WebImageCache readCacheFromImageID:ImageId isThumbnailUrl:isThumbnailUrl];
    if (data != nil) {
        yfImage = [UIImage imageWithData:data];
        self.image = yfImage;
    }else{
        dispatch_queue_t dispatch_g =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        dispatch_async(dispatch_g, ^{
            NSURL * dataUrl = [NSURL URLWithString:url];
            NSData *data = [NSData dataWithContentsOfURL:dataUrl];
            if (data != nil) {
                 yfImage = [UIImage imageWithData:data];
                [YF_WebImageCache writeCacheToImageID:ImageId withData:data isThumbnailUrl: isThumbnailUrl];
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.image = yfImage;
                });
            }
        });
    }
}
@end
