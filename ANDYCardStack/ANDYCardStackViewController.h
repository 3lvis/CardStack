//
//  ANDYCardStackViewController.h
//  Demo
//
//  Created by Elvis Nunez on 3/4/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

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
