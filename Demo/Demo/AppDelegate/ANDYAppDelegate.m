#import "ANDYAppDelegate.h"
#import "ANDYMainViewController.h"
#import "ANDYCardStackLayout.h"

static NSUInteger ANDYDefaultVisibleHeight = 60;

@implementation ANDYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    ANDYCardStackLayout *layout = [[ANDYCardStackLayout alloc] init];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    layout.actualCellHeight = CGRectGetHeight(bounds) - 120.0f;
    layout.visibleCellHeight = ANDYDefaultVisibleHeight;

    ANDYMainViewController *stackController = [[ANDYMainViewController alloc] initWithCollectionViewLayout:layout];
    self.window.rootViewController = stackController;

    [self.window makeKeyAndVisible];
    return YES;
}

@end
