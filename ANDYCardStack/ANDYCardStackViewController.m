//
//  ANDYCardStackViewController.m
//  Demo
//
//  Created by Elvis Nunez on 3/4/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

#import "ANDYCardStackViewController.h"
#import "ANDYCardStackDataSource.h"
#import "ANDYCardStackLayout.h"
#import "ANDYCardCell.h"

@interface ANDYCardStackViewController ()
@property (nonatomic, strong) ANDYCardStackDataSource *dataSource;
@property (nonatomic, strong) ANDYCardStackLayout *layout;
@end

@implementation ANDYCardStackViewController

- (instancetype)initWithCollectionViewLayout:(ANDYCardStackLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        _layout = layout;
    }
    return self;
}

- (ANDYCardStackDataSource *)dataSource
{
    if (_dataSource) {
        return _dataSource;
    }
    
    _dataSource = [[ANDYCardStackDataSource alloc] init];
    return _dataSource;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.dataSource = self.dataSource;
    [self.collectionView registerClass:[ANDYCardCell class] forCellWithReuseIdentifier:[ANDYCardCell reusedIdentifier]];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.collectionView performBatchUpdates:^{
        [self.dataSource selectCardAtIndexPath:indexPath];
    } completion:nil];
    
    [self.layout invalidateLayout];
}

@end