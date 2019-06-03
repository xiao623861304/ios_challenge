//
//  Model.h
//  showImageList
//
//  Created by yan feng on 2019/6/1.
//  Copyright © 2019 Yan feng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ModelCallBack)(NSArray * modelArray);
@interface Model : NSObject
@property(strong , nonatomic)NSString *imageID;
@property(strong,nonatomic)NSString *imageURL;
@property(strong,nonatomic)NSString *thumbnailUrl;
+(void)getImageList:(NSString *)url block:(ModelCallBack)callBack;
@end

NS_ASSUME_NONNULL_END
