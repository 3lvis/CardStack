//
//  ANDYCardStackViewController.m
//  Demo
//
//  Created by Elvis Nunez on 3/4/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

#import "ANDYCardStackViewController.h"
#import "ANDYCardStackView.h"

@interface ANDYCardStackViewController ()

@end

@implementation ANDYCardStackViewController

- (void)loadView
{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    ANDYCardStackView *view = [[ANDYCardStackView alloc] initWithFrame:bounds];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
