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
        cardView.clipsToBounds = YES;
        [self.contentView addSubview:cardView];
        
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, -2);
        self.layer.shadowOpacity = 0.5f;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10].CGPath;
        
        self.clipsToBounds = NO;

        UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panning:)];
        [self addGestureRecognizer:gestureRecognizer];

    }
    return self;
}

+ (NSString *)reusedIdentifier
{
    return @"ANDYPassbookCellID";
}

- (void)panning:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self];
    recognizer.view.center = CGPointMake(recognizer.view.center.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if ([self.delegate respondsToSelector:@selector(cardCellDidPan:atIndexPath:)]) {
            [self.delegate cardCellDidPan:self atIndexPath:self.indexPath];
        }
    }
}

@end