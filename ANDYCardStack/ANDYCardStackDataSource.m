//
//  ANDYCardStackDataSource.m
//  Demo
//
//  Created by Elvis Nunez on 3/5/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

#import "ANDYCardStackDataSource.h"
#import "ANDYCardCell.h"

@interface ANDYCardStackDataSource ()
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation ANDYCardStackDataSource

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


- (ANDYCardState)cardStateAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *cardState = self.cards[indexPath.row];
    return [cardState intValue];
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

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cards.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ANDYCardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ANDYCardCell reusedIdentifier] forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"Card %ld", (long)indexPath.row];
    return cell;
}

@end
