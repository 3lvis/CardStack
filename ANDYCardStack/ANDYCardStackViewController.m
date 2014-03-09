//
//  ANDYCardStackViewController.m
//  Demo
//
//  Created by Elvis Nunez on 3/4/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

#import "ANDYCardStackViewController.h"
#import "ANDYCardStackDataSource.h"
#import "ANDYCardStackDelegate.h"
#import "ANDYCardStackLayout.h"
#import "ANDYCardCell.h"

@interface ANDYCardStackViewController ()
@property (nonatomic, strong) ANDYCardStackDataSource *dataSource;
@property (nonatomic, strong) ANDYCardStackLayout *layout;
@property (nonatomic, strong) ANDYCardStackDelegate *delegate;
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

- (ANDYCardStackDelegate *)delegate
{
    if (_delegate) {
        return _delegate;
    }

    _delegate = [[ANDYCardStackDelegate alloc] initWithCollectionView:self.collectionView];
    return _delegate;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.dataSource = self.dataSource;
    self.collectionView.delegate = self.delegate;
    [self.collectionView registerClass:[ANDYCardCell class] forCellWithReuseIdentifier:[ANDYCardCell reusedIdentifier]];
}

@end