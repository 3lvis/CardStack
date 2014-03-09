//
//  ANDYCardStackDelegate.m
//  Demo
//
//  Created by Elvis Nunez on 09/03/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

#import "ANDYCardStackDelegate.h"
#import "ANDYCardStackDataSource.h"
#import "ANDYCardStackLayout.h"

@interface ANDYCardStackDelegate ()
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation ANDYCardStackDelegate

- (id)initWithCollectionView:(UICollectionView *)collectionView
{
    self = [super init];
    if (self) {
        _collectionView = collectionView;
    }
    return self;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.collectionView performBatchUpdates:^{
        [self selectCardAtIndexPath:indexPath];
    } completion:nil];


    ANDYCardStackLayout *layout = (ANDYCardStackLayout *)self.collectionView.collectionViewLayout;
    [layout invalidateLayout];
}

- (void)selectCardAtIndexPath:(NSIndexPath *)indexPath
{
    ANDYCardStackDataSource *dataSource = self.collectionView.dataSource;
    ANDYCardState cardState = [dataSource cardStateAtIndexPath:indexPath];

    switch (cardState) {
        case ANDYCardStateNormal:
            [dataSource collapseRows:indexPath.row];
            break;
        case ANDYCardStateSelected:
        case ANDYCardStateCollapsed:
            [dataSource expandRows];
        default:
            break;
    }
}

@end
