//
//  UIImageView+YF_WebImage.h
//  showImageList
//
//  Created by yan feng on 2019/6/1.
//  Copyright © 2019 Yan feng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (YF_WebImage)
-(void)setYF_WebImageWithUrl:(NSString *)url PlaceHolder:(NSString *)defaultImage ID:(NSString *)ImageId isthumbnailUrl:(BOOL)isThumbnailUrl;

@end

NS_ASSUME_NONNULL_END
