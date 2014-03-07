//
//  ANDYCardCell.m
//  Demo
//
//  Created by Elvis Nunez on 3/5/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

#import "ANDYCardCell.h"

@interface ANDYCardCell ()
@end

@implementation ANDYCardCell

- (UILabel *)label
{
    if (_label) {
        return _label;
    }
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, CGRectGetWidth(self.contentView.frame), 60)];
    _label.textAlignment = NSTextAlignmentLeft;
    _label.font = [UIFont fontWithName:@"Avenir-Medium" size:42];
    _label.textColor = [UIColor whiteColor];
    _label.backgroundColor = [UIColor clearColor];
    return _label;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth(frame), CGRectGetHeight(frame))];
    if (self) {
        UIView *cardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        cardView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.f
                                                   green:arc4random_uniform(256)/255.f
                                                    blue:arc4random_uniform(256)/255.f
                                                   alpha:1];
        cardView.layer.cornerRadius = 10;
        cardView.layer.borderColor = [UIColor darkGrayColor].CGColor;
        cardView.layer.borderWidth = 2;
        cardView.clipsToBounds = YES;
        [self.contentView addSubview:cardView];
        
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, -2);
        self.layer.shadowOpacity = .75;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10].CGPath;
        
        self.clipsToBounds = NO;
        
        [self.contentView addSubview:self.label];
    }
    return self;
}

+ (NSString *)reusedIdentifier
{
    return @"PassbookCellId";
}

@end