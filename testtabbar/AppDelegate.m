//
//  AppDelegate.m
//  testtabbar
//
//  Created by Chu Mohua on 12-9-29.
//  Copyright (c) 2012年 Chu Mohua. All rights reserved.
//

#import "AppDelegate.h"

#import "DONBETabBarViewController.h"

#import "ViewController2.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    ViewController *v = [ViewController new];
    ViewController2 *v2 = [ViewController2 new];
    
    DONBETabBarViewController *tabbar = [DONBETabBarViewController new];
    tabbar.viewControllers = @[v,v2];
    
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [b1 setImage:[UIImage imageNamed:@"111.png"] forState:UIControlStateNormal];
    [b1 setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateSelected];
    UIButton *b2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [b2 setImage:[UIImage imageNamed:@"222.png"] forState:UIControlStateNormal];
    [b2 setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateSelected];
    
    [tabbar setupCustomElements:@[b1,b2]];
    [tabbar setupBackground:@"bgd_topbar.png"];
    
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
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
