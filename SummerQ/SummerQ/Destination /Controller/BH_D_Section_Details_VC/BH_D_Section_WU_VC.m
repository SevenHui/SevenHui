



//
//  BH_D_Section_WU_VC.m
//  SummerQ
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_Section_WU_VC.h"

@interface BH_D_Section_WU_VC ()

@end

@implementation BH_D_Section_WU_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    
    
}
-(void)config{
    self.view.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100 * lfweight, HEIGHT / 2 - 120 * lfheight, 200 * lfweight, 100 * lfheight)];
//    label.backgroundColor = [UIColor grayColor];
//    label.layer.cornerRadius = 10;
    label.text = @"界面不存在";
    label.textAlignment = 1;
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    [label release];

    [self.view jxl_setDayMode:^(UIView *view) {
        //改变
        self.view.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.view.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

#pragma 自定义导航返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回键"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
}
#pragma mark - 返回按钮
- (void)leftAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];

}









@end
