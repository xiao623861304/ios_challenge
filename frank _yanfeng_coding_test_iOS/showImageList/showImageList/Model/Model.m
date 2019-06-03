//
//  Model.m
//  showImageList
//
//  Created by yan feng on 2019/6/1.
//  Copyright © 2019 Yan feng. All rights reserved.
//

#import "Model.h"


@implementation Model
+(void)getImageList:(NSString *)url block:(nonnull ModelCallBack)callBack{
    NSURL *requestUrl = [NSURL URLWithString:url];
    NSURLRequest *resquest = [NSURLRequest requestWithURL:requestUrl];
    NSArray *array = [[NSArray alloc] init];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:resquest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 200)
        {
            NSError *parseError = nil;
            NSArray *response = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            NSMutableArray *marr = [[NSMutableArray alloc]init];
            for (NSDictionary * dic in response) {
                Model *model = [[Model alloc] init];
                model.imageURL = dic[@"url"];
                model.thumbnailUrl = dic[@"thumbnailUrl"];
                model.imageID = dic[@"id"];
                [marr addObject:model];
            }
//            NSLog(@"The response is - %lu",(unsigned long)responseDictionary.count);
                callBack([NSArray arrayWithArray:marr]);
        }
        else
        {
            NSLog(@"Error");
        }
    }];
    [task resume];
//    callBack(array);
}
@end
