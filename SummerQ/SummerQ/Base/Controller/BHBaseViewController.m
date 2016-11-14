//
//  BHBaseViewController.m
//  SummerQ
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseViewController.h"
#import "JXLDayAndNightMode.h"
#import "BH_Mine_VC.h"
@interface BHBaseViewController ()

@end

@implementation BHBaseViewController
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:JXLChangeModeNotification object:nil];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor =  [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.00]}];
    
    //设置日间和夜间两张状态
    [self.view jxl_setDayMode:^(UIView *view) {
        //设置日间模式
        view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.00];
        
    } nightMode:^(UIView *view) {
        view.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];
    [self.navigationController.navigationBar jxl_setDayMode:^(UIView *view) {
        UINavigationBar *bar = (UINavigationBar *)view;
        //改变状态栏前景颜色
        bar.barStyle = UIBarStyleDefault;
        bar.barTintColor = [UIColor colorWithRed:0.45 green:0.69 blue:0.54 alpha:1.00];
    } nightMode:^(UIView *view) {
        UINavigationBar *bar = (UINavigationBar *)view;
        //改变状态栏前景颜色
        bar.barStyle = UIBarStyleDefault;
        bar.barTintColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];
    [self.tabBarController.tabBar jxl_setDayMode:^(UIView *view) {
        UITabBar *tab = (UITabBar *)view;
        tab.barTintColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.00];
    } nightMode:^(UIView *view) {
        UITabBar *tab = (UITabBar *)view;
        tab.barTintColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];
    
    
}


@end
