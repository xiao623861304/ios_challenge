//
//  ShowImageViewCell.m
//  showImageList
//
//  Created by yan feng on 2019/6/1.
//  Copyright © 2019 Yan feng. All rights reserved.
//

#import "ShowImageViewCell.h"
#import "UIImageView+YF_WebImage.h"

@interface ShowImageViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *showImage;

@end

@implementation ShowImageViewCell

-(void)showImagewithMode:(Model *)model atIndex:(NSInteger)index{
//    NSLog(@"----%@",model.imageURL);
    [self.showImage setYF_WebImageWithUrl:model.imageURL PlaceHolder:@"placeholder.jpg" ID:model.imageID isthumbnailUrl:true];
}

@end


