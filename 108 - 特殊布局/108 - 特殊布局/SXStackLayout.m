//
//  SXStackLayout.m
//  108 - 特殊布局
//
//  Created by 董 尚先 on 15/3/20.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXStackLayout.h"

@implementation SXStackLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i<count; i++) {
        NSIndexPath *path = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:path];
        [array addObject:attrs];
    }
    
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.center = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    attrs.size = CGSizeMake(100, 100);
    attrs.zIndex = - indexPath.item; // 设置层叠顺序
    // 第0个
    if (indexPath.item == 0) return attrs;
    
    // 第[5, N]个
    if (indexPath.item > 4) {
        attrs.hidden = YES;
        return attrs;
    }
    
    // indexPath.item == [1, 2, 3, 4]
    NSArray *angles = @[@0, @(-0.2), @(0.2), @(-0.5), @(0.5)];
    CGFloat angle = [angles[indexPath.item] doubleValue];
    attrs.transform = CGAffineTransformMakeRotation(angle);
    
    return attrs;
}

@end

