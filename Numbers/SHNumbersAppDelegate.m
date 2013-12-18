//
//  SHNumbersAppDelegate.m
//  Numbers
//
//  Created by Oscar Rundh on 2012-09-09.
//  Copyright (c) 2012 Oscar Rundh. All rights reserved.
//

#import "SHNumbersAppDelegate.h"
#import "SHNumbersViewController.h"

@implementation SHNumbersAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    SHNumbersViewController *view = [[SHNumbersViewController alloc]init];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:view];
    navController.navigationBar.barStyle = UIBarStyleDefault;
    [[self window] setRootViewController:navController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
