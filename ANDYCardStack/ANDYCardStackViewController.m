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
    return _layout;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
}

@end