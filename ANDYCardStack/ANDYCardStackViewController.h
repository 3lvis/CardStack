@protocol ANDYCardStackViewControllerDataSource;
@protocol ANDYCardStackViewControllerDelegate;

typedef NS_ENUM(NSInteger, ANDYCardState) {
    ANDYCardStateNormal,
    ANDYCardStateSelected,
    ANDYCardStateCollapsed
};

@interface ANDYCardStackViewController : UICollectionViewController

@property (nonatomic, weak) id <ANDYCardStackViewControllerDelegate> delegate;
@property (nonatomic, weak) id <ANDYCardStackViewControllerDataSource> dataSource;

@end

@protocol ANDYCardStackViewControllerDataSource <NSObject>

@required

- (NSMutableArray *)objects;
- (void)clearObjects;

@end

@protocol ANDYCardStackViewControllerDelegate <NSObject>

- (void)cardStackController:(ANDYCardStackViewController *)cardStackController
   didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end
