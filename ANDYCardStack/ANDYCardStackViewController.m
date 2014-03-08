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

static NSUInteger ANDYDefaultVisibleHeight = 60;

@interface ANDYCardStackViewController ()
@property (nonatomic, strong) ANDYCardStackDataSource *dataSource;
@property (nonatomic, strong) ANDYCardStackLayout *layout;
@end

@implementation ANDYCardStackViewController

- (ANDYCardStackDataSource *)dataSource
{
    if (_dataSource) {
        return _dataSource;
    }
    
    _dataSource = [[ANDYCardStackDataSource alloc] init];
    return _dataSource;
}

- (ANDYCardStackLayout *)layout
{
    if (_layout) {
        return _layout;
    }
    
    _layout = [[ANDYCardStackLayout alloc] init];
    _layout.actualCellHeight = CGRectGetHeight(self.view.frame) - 120.0f;
    _layout.visitableCellHeight = ANDYDefaultVisibleHeight;
    return _layout;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.collectionView.delegate = self;
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