//
//  ViewController.m
//  showImageList
//
//  Created by yan feng on 2019/6/1.
//  Copyright © 2019 Yan feng. All rights reserved.
//

#import "ViewController.h"
#import "ShowImageViewCell.h"
#import "Model.h"
#import "DisplayOiginalImageViewController.h"
#import "YF_WebImageCache.h"

const NSString * _Nonnull baseUrl = @"https://jsonplaceholder.typicode.com/photos";
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *conllectionView;
@property(strong , nonatomic)NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.array = [[NSArray alloc] init];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"ClearCache" style:UIBarButtonItemStylePlain target:self action:@selector(clearCache)];
    [self getData];
}
-(void)getData{
    [Model getImageList:baseUrl block:^(NSArray * _Nonnull modelArray) {
        self.array = modelArray;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.conllectionView reloadData];
        });
    }];
}
-(void)clearCache{
    [YF_WebImageCache removeAllCache];
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ShowImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"showImageCell" forIndexPath:indexPath];
    [cell showImagewithMode:self.array[indexPath.row] atIndex:indexPath.row];

    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;
}

-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath{
    CGFloat screenWith=[UIScreen mainScreen].bounds.size.width;
    CGFloat cellWidth= screenWith/3-10;
    return CGSizeMake(cellWidth,100);
}

-(CGFloat)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"----%ld",(long)indexPath.row);
    DisplayOiginalImageViewController *vc = [[DisplayOiginalImageViewController alloc] init];
    vc.model = self.array[indexPath.row];
    [self.navigationController pushViewController:vc animated: true];
}
@end
