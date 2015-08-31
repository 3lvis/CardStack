#import "ANDYCardStackViewController.h"
#import "ANDYCardStackLayout.h"
#import "ANDYCardCell.h"

@interface ANDYCardStackViewController () <ANDYCardCellDelegate, ANDYCardStackLayoutDataSource>
@property (nonatomic, strong) ANDYCardStackLayout *layout;
@end

@implementation ANDYCardStackViewController

- (instancetype)initWithCollectionViewLayout:(ANDYCardStackLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if (!self) return nil;

    _layout = layout;
    _layout.dataSource = self;

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.collectionView registerClass:[ANDYCardCell class]
            forCellWithReuseIdentifier:[ANDYCardCell reusedIdentifier]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[self.dataSource objects] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ANDYCardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ANDYCardCell reusedIdentifier]
                                                                   forIndexPath:indexPath];
    cell.delegate = self;
    cell.indexPath = indexPath;

    return cell;
}

- (void)expandRows
{
    [self.dataSource clearObjects];
}

- (void)collapseRows:(NSUInteger)selectedRow
{
    NSUInteger count = [[self.dataSource objects] count];
    NSMutableArray *cards = [self.dataSource objects];

    for (NSUInteger index = 0; index < count; index++) {

        if (index == selectedRow) {
            cards[index] = @(ANDYCardStateSelected);
        } else {
            cards[index] = @(ANDYCardStateCollapsed);
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

    if ([self.delegate respondsToSelector:@selector(cardStackController:didSelectItemAtIndexPath:)]) {
        [self.delegate cardStackController:self didSelectItemAtIndexPath:indexPath];
    }
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
            break;
        default: break;
    }
}

#pragma mark - ANDYCardStackLayoutDataSource

- (ANDYCardState)cardStateAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *cards = [self.dataSource objects];
    NSNumber *cardState = cards[indexPath.row];

    return [cardState intValue];
}

@end
