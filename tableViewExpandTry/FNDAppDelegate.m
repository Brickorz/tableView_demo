//
//  FNDAppDelegate.m
//  tableViewExpandTry
//
//  Created by dev 1 on 12-10-17.
//  Copyright (c) 2012年 dev 1. All rights reserved.
//

#import "FNDAppDelegate.h"
#import "FNDMainViewController.h"

@implementation FNDAppDelegate

#pragma mark - manage memory methods
- (void)dealloc
{
    [_window release];
    [super dealloc];
}

#pragma mark - lifeCycle methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    FNDMainViewController *mainViewController = [[FNDMainViewController alloc] initWithStyle:UITableViewStyleGrouped];
    self.window.rootViewController = mainViewController;
    [mainViewController release];
    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
