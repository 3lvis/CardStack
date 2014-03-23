//
//  ANDYCardStackLayout.h
//  Demo
//
//  Created by Elvis Nunez on 3/5/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

@import UIKit;

#import "ANDYCardCell.h"
#import "ANDYCardStackViewController.h"

@protocol ANDYCardStackLayoutDataSource;

@interface ANDYCardStackLayout : UICollectionViewLayout
@property (nonatomic) NSUInteger visibleCellHeight;
@property (nonatomic) NSUInteger actualCellHeight;
@property (nonatomic, weak) id <ANDYCardStackLayoutDataSource> dataSource;
@end

@protocol ANDYCardStackLayoutDataSource <NSObject>
- (ANDYCardState)cardStateAtIndexPath:(NSIndexPath *)indexPath;
@end

