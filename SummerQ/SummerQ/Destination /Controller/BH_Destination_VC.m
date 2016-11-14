//
//  BH_Destination_VC.m
//  SummerQ
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 沐沐`柒. All rights reserved.

//  Destination 目的地

#import "BH_Destination_VC.h"
#import "BHNetTool.h"
#import "BH_D_HeaderView.h"
#import "BH_D_FirstSection_TableViewCell.h"
#import "BH_D_SecondSection_TableViewCell.h"
#import "BH_Destination_M.h"
#import "BH_D_Section_Details_VC.h"
#import "BH_D_Smail_Model.h"
@interface BH_Destination_VC ()
<UITableViewDataSource, UITableViewDelegate,
BH_D_HeaderViewDelegate>

/**UITableView*/
@property (nonatomic, retain)UITableView *tableView;
/**头视图数组*/
@property (nonatomic, retain)NSMutableArray *arrHeaderView;
/**头视图*/
@property (nonatomic, retain)UIView *headerView;
/**自定义头视图*/
@property (nonatomic, retain)BH_D_HeaderView *custom_headerView;
/**数据数组*/
@property (nonatomic, retain)NSMutableArray *arrModel;
/**大Model数组*/
@property (nonatomic, retain)BH_Destination_M *model;

@end

@implementation BH_Destination_VC
-(void)dealloc{
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
    [_model release];
    [_arrModel release];
    [_custom_headerView release];
    [_headerView release];
    [_arrHeaderView release];
    [_tableView release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    [self creatTableView];
    [self getDataFromJson];
    
    
}
-(void)config{
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.35 green:0.71 blue:0.54 alpha:1.00];
    self.title = @"目的地";
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 数据数组
    self.arrModel = [NSMutableArray array];
    // 大Model数组
    self.model = [[BH_Destination_M alloc]init];
    
}
#pragma mark - UITableView
-(void)creatTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64 - 49) style:0];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:_tableView];
    [self.tableView release];

    [self.tableView jxl_setDayMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

#pragma mark - 头视图
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, 270 * lfheight)];
    self.headerView.backgroundColor = [UIColor blueColor];
    self.tableView.tableHeaderView = _headerView;
    [self.headerView release];
    
    self.custom_headerView = [[BH_D_HeaderView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, 270 * lfheight)];
    self.custom_headerView.backgroundColor = [UIColor redColor];
    [self.tableView addSubview:_custom_headerView];
    
    self.custom_headerView.delegate = self;
    
#pragma mark - 第一分区
    [self.tableView registerClass:[BH_D_FirstSection_TableViewCell class] forCellReuseIdentifier:@"FirstCell"];
#pragma mark - 第二分区
    [self.tableView registerClass:[BH_D_SecondSection_TableViewCell class] forCellReuseIdentifier:@"Secondcell"];
    
}
#pragma mark - 分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
    
}
#pragma mark - 分区标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
        
    NSMutableArray *arrHeader = [NSMutableArray arrayWithObjects:@"热门目的地",@"其他目的地", nil];
    
    return arrHeader[section];
    
}
#pragma mark - 行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 1;
    }
}
#pragma mark - cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
#pragma mark - 第一分区 热门目的地
        BH_D_FirstSection_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstCell"];
        
//        cell.backgroundColor = [UIColor redColor];
        
        BH_Destination_M *model = self.model;
        cell.array = model.arrHot_country;

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
        }];

        return cell;
    }else{
#pragma mark - 第二分区 其他目的地
        BH_D_SecondSection_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Secondcell"];
        BH_Destination_M *model = self.model;
        cell.arrayQ = model.arrCountry;
        cell.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
        }];

#pragma mark - block跳转
        void(^detailsVC)(BH_D_Section_Details_VC *) = ^(BH_D_Section_Details_VC  *detailsVC){
            
            BH_D_Smail_Model *model = cell.arrayQ[indexPath.row];
            
            detailsVC.ID = model.id;

            [self.navigationController pushViewController:detailsVC animated:YES];
            
        };
        cell.block = detailsVC;
        
        return cell;
        
    }
    
}
#pragma mark - 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 1200 * lfheight;
    }else{
        return self.arrModel.count * 250 * lfheight;
    }
}
#pragma mark - 目的地数据解析
-(void)getDataFromJson{
    [self.arrModel removeAllObjects];
    [BHNetTool GET:@"http://open.qyer.com/qyer/footprint/continent_list?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=867168024167485&5track_app_version=6.9.4&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877" body:nil headerFile:nil response:BHJSON success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        
        [BHCacheTool archiverObject:dic ByKey:@"destinationCache"WithPath:@"destination.plist"];

        NSMutableArray *arrayData = dic[@"data"];
        for (NSDictionary *dic in arrayData) {
            BH_Destination_M *bigModel = [[BH_Destination_M alloc] initWithDic:dic];                                                    
            [self.arrModel addObject:bigModel];
            
        }
        self.model = self.arrModel[0];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"destinationCache"WithPath:@"destination.plist"];
        
        NSMutableArray *arrayData = dic[@"data"];
        for (NSDictionary *dic in arrayData) {
            BH_Destination_M *bigModel = [[BH_Destination_M alloc] initWithDic:dic];
            [self.arrModel addObject:bigModel];
            
        }
        self.model = self.arrModel[0];
        [self.tableView reloadData];


        
    }];
    
}
#pragma mark - 根据名字协议传值 
- (void)title:(NSString *)str {
//    NSLog(@"str: %@", str);
    
    for (BH_Destination_M *model in self.arrModel) {
        if ([model.cnname isEqualToString:str]) {
            self.model = model;
    
//    NSLog(@"----------------%@", model.cnname);
            
        }
    }

    [self.tableView reloadData];
}

@end
