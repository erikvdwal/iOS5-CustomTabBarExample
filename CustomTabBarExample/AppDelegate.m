//
//  AppDelegate.m
//  CustomTabBarExample
//
//  Created by Erik van der Wal on 25-09-12.
//  Copyright (c) 2012 Erik van der Wal. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSArray *titles = @[@"Playlist", @"Artist", @"Track", @"Album", @"More"];
    
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:5];
    for (uint i = 0; i < 5; i++) {
        UIImage *tabImage = [UIImage imageNamed:[NSString stringWithFormat:@"icon%i", (i+1)]]; // icon1, icon2, etc..
        
        UIViewController *viewController = [[UIViewController alloc] init];
        [viewController.view setBackgroundColor:[UIColor colorWithRed:0.918 green:0.917 blue:0.940 alpha:1.000]];

        // Change the image and title for the view controller's tabbar item
        [viewController.tabBarItem setTitle:[titles objectAtIndex:i]]; // corresponding title
        [viewController.tabBarItem setFinishedSelectedImage:tabImage withFinishedUnselectedImage:tabImage];
        
        // Add the view controller to the array
        [viewControllers addObject:viewController];
    }
    
    // Change the tabbar's background and selection image through the appearance proxy
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar_bg.png"]];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selection.png"]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:viewControllers];
    [tabBarController setSelectedIndex:0];
        
    // Text appearance values for the tab in normal state
    NSDictionary *normalState = @{
        UITextAttributeTextColor : [UIColor colorWithWhite:0.213 alpha:1.000],
        UITextAttributeTextShadowColor: [UIColor whiteColor],
        UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0, 1.0)]
    };
    
    // Text appearance values for the tab in highlighted state
    NSDictionary *selectedState = @{
        UITextAttributeTextColor : [UIColor blackColor],
        UITextAttributeTextShadowColor: [UIColor whiteColor],
        UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0, 1.0)]
    };
    
    [[UITabBarItem appearance] setTitleTextAttributes:normalState forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:selectedState forState:UIControlStateHighlighted];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    [self.window setRootViewController:tabBarController]; // We'll just present the tabbar controller
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
