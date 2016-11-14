//
//  AppDelegate.m
//  SummerQ
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "AppDelegate.h"
#import "BH_Recommend_VC.h"
#import "BH_Destination_VC.h"
#import "BH_Community_VC.h"
#import "BH_Mine_VC.h"
#import "KSGuideManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
-(void)dealloc{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //推荐
    BH_Recommend_VC *recommend = [[BH_Recommend_VC alloc]init];
    UIImage *recommendNomanlImage = [[UIImage imageNamed:@"推荐-1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *recommendSelectImage = [[UIImage imageNamed:@"推荐-2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    recommend.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"推荐" image:recommendNomanlImage selectedImage:recommendSelectImage];
    UINavigationController *recommendNavi = [[UINavigationController alloc]initWithRootViewController:recommend];
    //目的地
    BH_Destination_VC *destination = [[BH_Destination_VC alloc]init];
    UIImage *destinationNomalImage = [[UIImage imageNamed:@"目的地-1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *destinationSelectImage = [[UIImage imageNamed:@"目的地-2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    destination.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"目的地" image:destinationNomalImage selectedImage:destinationSelectImage];
    UINavigationController *destinationNavi = [[UINavigationController alloc]initWithRootViewController:destination];
    
    //社区
    BH_Community_VC *community = [[BH_Community_VC alloc]init];
    UIImage *communityNomalImage = [[UIImage imageNamed:@"社区-1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *communitySelectImage = [[UIImage imageNamed:@"社区-2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    community.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"社区" image:communityNomalImage selectedImage:communitySelectImage];
    UINavigationController *communityNavi = [[UINavigationController alloc]initWithRootViewController:community];
    
    //我的
    BH_Mine_VC *mine = [[BH_Mine_VC alloc]init];
    UIImage *mineNomalImage = [[UIImage imageNamed:@"我的-1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *mineSelectImage = [[UIImage imageNamed:@"我的-2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mine.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:mineNomalImage selectedImage:mineSelectImage];
    UINavigationController *mineNavi = [[UINavigationController alloc]initWithRootViewController:mine];
    
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    tabBar.viewControllers = @[recommendNavi, destinationNavi, communityNavi, mineNavi];
    self.window.rootViewController = tabBar;
    //tabbar字体颜色
    tabBar.tabBar.tintColor = [UIColor lightGrayColor];
    //tabbar背景颜色
    tabBar.tabBar.barTintColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    
#pragma mark - 引导页
    NSMutableArray *images = [NSMutableArray new];
    [images addObject:[UIImage imageNamed:@"00"]];
    [images addObject:[UIImage imageNamed:@"01"]];
    [images addObject:[UIImage imageNamed:@"02"]];
    [[KSGuideManager shared] showGuideViewWithImages:images];

    
    
    //内存管理
    [recommend release];
    [recommendNavi release];
    [destination release];
    [destinationNavi release];
    [community release];
    [communityNavi release];
    [mine release];
    [mineNavi release];
    [_window release];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
