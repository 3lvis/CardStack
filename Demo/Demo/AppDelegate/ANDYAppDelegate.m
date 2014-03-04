//
//  ANDYAppDelegate.m
//  Demo
//
//  Created by Elvis Nunez on 3/4/14.
//  Copyright (c) 2014 ANDY. All rights reserved.
//

#import "ANDYAppDelegate.h"
#import "ANDYCardStackViewController.h"

@implementation ANDYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ANDYCardStackViewController *stackController = [[ANDYCardStackViewController alloc] init];
    self.window.rootViewController = stackController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end