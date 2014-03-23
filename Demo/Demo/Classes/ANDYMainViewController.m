//
//  ANDYMainViewController.m
//  Demo
//
//  Created by Elvis Nunez on 3/23/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

#import "ANDYMainViewController.h"

@interface ANDYMainViewController () <ANDYCardStackViewControllerDataSource, ANDYCardStackViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation ANDYMainViewController

- (NSMutableArray *)cards
{
    if (_cards) {
        return _cards;
    }

    _cards = [[NSMutableArray alloc] initWithArray:
              @[ @(ANDYCardStateNormal),
                 @(ANDYCardStateNormal),
                 @(ANDYCardStateNormal),
                 @(ANDYCardStateNormal),
                 @(ANDYCardStateNormal),
                 @(ANDYCardStateNormal)]];
    
    return _cards;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataSource = self;
    self.delegate = self;
}

#pragma mark - ANDYCardStackViewControllerDataSource

- (NSMutableArray *)objects
{
    return self.cards;
}

- (void)clearObjects
{
    self.cards = nil;
}

#pragma mark - ANDYCardStackViewControllerDelegate

- (void)cardStackController:(ANDYCardStackViewController *)cardStackController didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"yay!");
}

@end