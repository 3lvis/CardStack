//
//  ANDYAppDelegate.m
//  Demo
//
//  Created by Elvis Nunez on 3/4/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

#import "ANDYAppDelegate.h"
#import "ANDYCardStackViewController.h"
#import "ANDYCardStackLayout.h"
static NSUInteger ANDYDefaultVisibleHeight = 60;

@implementation ANDYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    ANDYCardStackLayout *layout = [[ANDYCardStackLayout alloc] init];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    layout.actualCellHeight = CGRectGetHeight(bounds) - 120.0f;
    layout.visitableCellHeight = ANDYDefaultVisibleHeight;
    ANDYCardStackViewController *stackController = [[ANDYCardStackViewController alloc] initWithCollectionViewLayout:layout];
    self.window.rootViewController = stackController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end