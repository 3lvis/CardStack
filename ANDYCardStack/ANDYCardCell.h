//
//  ANDYCardCell.h
//  Demo
//
//  Created by Elvis Nunez on 3/5/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

@import UIKit;

@interface ANDYCardCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *label;
+ (NSString *)reusedIdentifier;
@end
