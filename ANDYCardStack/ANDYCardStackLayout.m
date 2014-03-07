//
//  ANDYCardStackLayout.m
//  Demo
//
//  Created by Elvis Nunez on 3/5/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

#import "ANDYCardStackLayout.h"
#import "ANDYCardStackDataSource.h"

static const NSUInteger ANDYBelowCellOffset = 45;
static const NSUInteger ANDYBelowCellHeight = 7;
static const CGFloat ANDYScaleFactor = 0.015f;

@implementation ANDYCardStackLayout

- (CGSize)collectionViewContentSize
{
    return self.collectionView.bounds.size;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layoutAttributes = [NSMutableArray array];
    
    NSArray *visibleIndexPaths = [self indexPathOfItemsInRect:rect];
    for (NSIndexPath *indexPath in visibleIndexPaths) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [layoutAttributes addObject:attributes];
    }
    return layoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    [self applyLayoutAttributes:layoutAttributes];
    return layoutAttributes;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)attributes
{
    ANDYCardStackDataSource *dataSource = self.collectionView.dataSource;
    
}

- (NSArray *)indexPathOfItemsInRect:(CGRect)rect
{
    return nil;
}

@end
