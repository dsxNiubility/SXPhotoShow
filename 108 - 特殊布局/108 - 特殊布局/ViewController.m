//
//  ViewController.m
//  108 - 特殊布局
//
//  Created by 董 尚先 on 15/3/20.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "ViewController.h"
#import "SXStackLayout.h"
#import "SXImageCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
/** 所有的图片名 */
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation ViewController

static NSString *const ID = @"image";

- (NSMutableArray *)images
{
    if (!_images) {
        self.images = [[NSMutableArray alloc] init];
        
        for (int i = 1; i<=12; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建布局
    SXStackLayout *layout = [[SXStackLayout alloc] init];
    
    // 创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor clearColor];
    [collectionView registerNib:[UINib nibWithNibName:@"SXImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    if ([self.collectionView.collectionViewLayout isKindOfClass:[SXStackLayout class]]) {
//        [self.collectionView setCollectionViewLayout:[[SXCircleLayout alloc] init] animated:YES];
//    } else {
//        [self.collectionView setCollectionViewLayout:[[SXStackLayout alloc] init] animated:YES];
//    }
//}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SXImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.image = self.images[indexPath.item];
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 删除图片名
    [self.images removeObjectAtIndex:indexPath.item];
    
    // 刷新数据
    //    [self.collectionView reloadData];
    
    // 直接将cell删除
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}


@end
