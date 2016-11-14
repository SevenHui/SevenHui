//
//  BH_Mine_VC.m
//  SummerQ
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 沐沐`柒. All rights reserved.

//  Mine 我的

#import "BH_Mine_VC.h"
#import "BH_M_Collect_VC.h"
#import "JXLDayAndNightMode.h"
#import "SDImageCache.h"
@interface BH_Mine_VC ()
<UITableViewDelegate, UITableViewDataSource,
UIScrollViewDelegate >

/**<#注释#>*/
@property (nonatomic, retain)UITableView *tableView;
/**<#注释#>*/
@property (nonatomic, retain)UIView *headerView;
/**<#注释#>*/
@property (nonatomic, retain)NSArray *array;
/**<#注释#>*/
@property (nonatomic, assign)BOOL result;
/**<#注释#>*/
@property (nonatomic, assign)BOOL again;
@end

@implementation BH_Mine_VC
-(void)dealloc{
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
    [_array release];
    [_headerView release];
    [_tableView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    [self creatTableView];
    
    
}
-(void)config{
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.35 green:0.71 blue:0.54 alpha:1.00];
    self.title = @"我的";
    
    self.array = [NSArray array];
    self.array = @[@"我的收藏", @"夜间模式", @"清除缓存"];
    
    
}
-(void)creatTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64 - 49) style:0];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:_tableView];
    [self.tableView release];
    // tableView下划线
    [self.tableView setSeparatorColor:[UIColor clearColor]];
    
    [self.tableView jxl_setDayMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];


#pragma mark - 头视图
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 250 * lfheight)];
    self.headerView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = self.headerView;
    [self.headerView release];
#pragma mark - 图片
    UIImageView *imageViewPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 250 * lfheight)];
    imageViewPhoto.image = [UIImage imageNamed:@"headImage_lite"];
    [self.headerView addSubview:imageViewPhoto];
    [imageViewPhoto release];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    cell.backgroundColor = [UIColor whiteColor];
    
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    [cell jxl_setDayMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor whiteColor];

    } nightMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];

    }];

    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60 * lfheight;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
#pragma mark - 我的收藏
        [self.navigationController pushViewController:[[BH_M_Collect_VC alloc]init] animated:YES];
    }
    if (indexPath.row == 1) {
#pragma mark - 夜间模式
        JXLDayAndNightManager *manager = [JXLDayAndNightManager shareManager];
        if (self.result) {
            [manager dayMode];

        }else{
            [manager nightMode];
        
        }
        self.result = !self.result;
        self.again = self.result;
    }
    if (indexPath.row == 2) {
#pragma mark - 清除缓存
        SDImageCache *sdImageCache = [SDImageCache sharedImageCache];
        
        NSString *str = [NSString stringWithFormat:@"缓存大小%.2fM.是否清除缓存?", [sdImageCache checkTmpSize]];
        
        NSString *cancelStr = @"取消";
        
        if ([sdImageCache checkTmpSize] == 0) {
            
            str = @"您还没有缓存, 不需要清理哦!";
            
            cancelStr = nil;
            
        }
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:str delegate:self cancelButtonTitle:cancelStr otherButtonTitles:@"确定", nil];
        
        // 这里执行协议方法的对象是这个视图控制器对象(协议方法是给别人用的)
        
        alertView.delegate = self;
        
        [alertView show];
        
        [alertView release];
        
        
    }
}
// alertView协议方法执行清除缓存的方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

{
    
    if (buttonIndex == 1) {
        
        [[SDImageCache sharedImageCache] clearDisk];
        
    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.result = self.again;

}
@end
