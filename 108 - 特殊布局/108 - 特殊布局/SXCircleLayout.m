//
//  SXCircleLayout.m
//  108 - 特殊布局
//
//  Created by 董 尚先 on 15/3/20.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXCircleLayout.h"

@implementation SXCircleLayout

/**
 * 决定cell怎么排布
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        // 创建i位置cell对应的indexPath
        NSIndexPath *path = [NSIndexPath indexPathForItem:i inSection:0];
        
        // 创建i位置cell对应的布局属性
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:path];
        
        // 添加布局属性
        [array addObject:attrs];
    }
    
    return array;
}

/**
 * 返回indexPath位置cell的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 半径
    CGFloat radius = 80;
    
    // 圆心
    CGFloat centerX = self.collectionView.frame.size.width * 0.5;
    CGFloat centerY = self.collectionView.frame.size.height * 0.5;
    
    // 创建i位置cell对应的布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.size = CGSizeMake(60, 60);
    
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    
    if (count == 1) {
        attrs.center = CGPointMake(centerX, centerY);
    } else {
        CGFloat angle = 2 * M_PI / count * indexPath.item;
        CGFloat attrsCenterX = centerX - radius * cos(angle);
        CGFloat attrsCenterY = centerY - radius * sin(angle);
        attrs.center = CGPointMake(attrsCenterX, attrsCenterY);
    }
    
    // 用来控制cell的层叠顺序，zIndex越大，cell越在上面
    //        attrs.zIndex = i;
    
    return attrs;
}
@end
