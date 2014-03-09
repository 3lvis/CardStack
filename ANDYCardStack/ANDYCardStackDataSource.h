//
//  ANDYCardStackDataSource.h
//  Demo
//
//  Created by Elvis Nunez on 3/5/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

@import Foundation;
@import UIKit;

typedef NS_ENUM(NSInteger, ANDYCardState) {
    ANDYCardStateNormal,
    ANDYCardStateSelected,
    ANDYCardStateCollapsed
};

@interface ANDYCardStackDataSource : NSObject <UICollectionViewDataSource>
- (ANDYCardState)cardStateAtIndexPath:(NSIndexPath *)indexPath;
- (void)expandRows;
- (void)collapseRows:(NSUInteger)selectedRow;
@end