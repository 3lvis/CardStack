//
//  ANDYCardCell.h
//  Demo
//
//  Created by Elvis Nunez on 3/5/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

@import UIKit;

@protocol ANDYCardCellDelegate;

@interface ANDYCardCell : UICollectionViewCell
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, weak) id <ANDYCardCellDelegate> delegate;
+ (NSString *)reusedIdentifier;
@end

@protocol ANDYCardCellDelegate <NSObject>
- (void)cardCellDidPan:(ANDYCardCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end