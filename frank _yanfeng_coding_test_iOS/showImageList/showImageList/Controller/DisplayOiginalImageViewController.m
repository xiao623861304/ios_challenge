//
//  DisplayOiginalImageViewController.m
//  showImageList
//
//  Created by yan feng on 2019/6/1.
//  Copyright © 2019 Yan feng. All rights reserved.
//

#import "DisplayOiginalImageViewController.h"
#import "UIImageView+YF_WebImage.h"

@interface DisplayOiginalImageViewController ()
@property(strong , nonatomic) UIImageView *showOiginallmageView;

@end

@implementation DisplayOiginalImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor whiteColor];
    self.showOiginallmageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    NSLog(@"%@",self.model.imageURL);
//    self.showOiginallmageView.backgroundColor = [UIColor redColor];
    [self.showOiginallmageView setYF_WebImageWithUrl:self.model.imageURL PlaceHolder:@"placeholder.jpg" ID:self.model.imageID isthumbnailUrl:false];
    [self.view addSubview:self.showOiginallmageView];
}

@end
