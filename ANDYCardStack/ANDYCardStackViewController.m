//
//  ANDYCardStackViewController.m
//  Demo
//
//  Created by Elvis Nunez on 3/4/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

#import "ANDYCardStackViewController.h"
#import "ANDYCardStackLayout.h"
#import "ANDYCardCell.h"

@interface ANDYCardStackViewController () <ANDYCardCellDelegate, ANDYCardStackLayoutDataSource>
@property (nonatomic, strong) ANDYCardStackLayout *layout;
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation ANDYCardStackViewController

- (instancetype)initWithCollectionViewLayout:(ANDYCardStackLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        _layout = layout;
        _layout.dataSource = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerClass:[ANDYCardCell class] forCellWithReuseIdentifier:[ANDYCardCell reusedIdentifier]];
}

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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cards.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ANDYCardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ANDYCardCell reusedIdentifier] forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"Card %ld", (long)indexPath.row];
    cell.delegate = self;
    cell.indexPath = indexPath;
    return cell;
}

- (void)expandRows
{
    self.cards = nil;
}

- (void)collapseRows:(NSUInteger)selectedRow
{
    for (NSUInteger index = 0; index < self.cards.count; index++) {
        if (index == selectedRow) {
            self.cards[index] = @(ANDYCardStateSelected);
        } else {
            self.cards[index] = @(ANDYCardStateCollapsed);
        }
    }
}

- (void)cardCellDidPan:(ANDYCardCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    [self animateSelectionAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self animateSelectionAtIndexPath:indexPath];
}

- (void)animateSelectionAtIndexPath:(NSIndexPath *)indexPath
{
    [self.collectionView performBatchUpdates:^{
        [self selectCardAtIndexPath:indexPath];
    } completion:nil];
    
    
    ANDYCardStackLayout *layout = (ANDYCardStackLayout *)self.collectionView.collectionViewLayout;
    [layout invalidateLayout];
}

- (void)selectCardAtIndexPath:(NSIndexPath *)indexPath
{
    ANDYCardState cardState = [self cardStateAtIndexPath:indexPath];
    
    switch (cardState) {
        case ANDYCardStateNormal:
            [self collapseRows:indexPath.row];
            break;
        case ANDYCardStateSelected:
        case ANDYCardStateCollapsed:
            [self expandRows];
        default:
            break;
    }
}

#pragma mark - ANDYCardStackLayoutDataSource

- (ANDYCardState)cardStateAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *cardState = self.cards[indexPath.row];
    return [cardState intValue];
}

@end