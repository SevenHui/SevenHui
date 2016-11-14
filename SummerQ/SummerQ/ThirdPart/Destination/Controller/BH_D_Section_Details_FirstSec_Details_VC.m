//
//  BH_D_Section_Details_FirstSec_Details_VC.m
//  SummerQ
//
//  Created by apple on 16/7/27.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  热门城市详情

#import "BH_D_Section_Details_FirstSec_Details_VC.h"
#import "BHNetTool.h"
#import "SDCycleScrollView.h"
#import "BH_D_Section_Details_firstSec_Details_TableViewCell.h"
#import "BH_D_Section_Details_FirstSec_Details_Model.h"
#import "BHSJK.h"
#import "BH_M_Collect_VC.h"
#import "BH_Map_VC.h"
#import "BH_Map_Model.h"
#import "BH_Map_TableViewCell.h"
@interface BH_D_Section_Details_FirstSec_Details_VC ()
<UITableViewDataSource, UITableViewDelegate, SDCycleScrollViewDelegate>
/**<#注释#>*/
@property (nonatomic, retain)UITableView *tableView;
/**<#注释#>*/
@property (nonatomic, retain)UIView *headerView;
/**轮播图*/
@property (nonatomic, retain)SDCycleScrollView *cycleScrollView;
/**头视图_轮播图数据数组*/
@property (nonatomic, retain)NSMutableArray *arrCycleScrollView;
/**不可错过数据数组*/
@property (nonatomic, retain)NSMutableArray *arrModel;
/**<#注释#>*/
@property (nonatomic, retain)BH_D_Section_Details_FirstSec_Details_Model *bigModel;
/**经纬度*/
@property (nonatomic, retain)NSString *strOne;
/**经纬度*/
@property (nonatomic, retain)NSString *strTwo;
/**收藏按钮监听变量*/
@property (nonatomic, assign)BOOL isCollected;
/**弹框*/
@property(nonatomic,retain)UIAlertController *alertController;

@end

@implementation BH_D_Section_Details_FirstSec_Details_VC
-(void)dealloc{
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
    [_strOne release];
    [_strTwo release];
    [_alertController release];
    [_arrModel release];
    [_arrCycleScrollView release];
    [_cycleScrollView release];
    [_headerView release];
    [_tableView release];
    [super dealloc];
}
#pragma mark - 收藏 将要出现时 判断
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    BHSJK *sjk = [[BHSJK alloc] init];
    self.isCollected = [sjk isCollectedInTableadS:_model.id];
    BHSJK *data = [[BHSJK alloc] init];
    BOOL judge = [data isCollectedInTableadS:_model.id];
    if (judge) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"收藏04"] imageWithRenderingMode:1]style:UIBarButtonItemStylePlain target:self action:@selector(changeBarBtnItem:)];
        
    }
    else{
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"收藏01"] imageWithRenderingMode:1]style:UIBarButtonItemStylePlain target:self action:@selector(changeBarBtnItem:)];
        
    }
    [self.tableView reloadData];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    [self getDataFromJson];
    [self creatTableView];
    
    
}
-(void)config{
    self.view.backgroundColor = [UIColor whiteColor];
    // 轮播图数组
    self.arrCycleScrollView = [NSMutableArray array];
    // 不可错过数据数组
    self.arrModel = [NSMutableArray array];
#pragma 自定义导航返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回键"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
}
#pragma mark - 返回按钮
- (void)leftAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];

}
#pragma mark - 收藏监听方法
- (void)changeBarBtnItem:(UIBarButtonItem *)btn{
    if (!self.isCollected){
        BHSJK *sjk = [BHSJK shareInstance];
        [sjk insert:self.model];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"收藏04"] imageWithRenderingMode:1]style:UIBarButtonItemStylePlain target:self action:@selector(changeBarBtnItem:)];
        // 弹框
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"已收藏" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertController animated:YES completion:nil];
        self.alertController = alertController;
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [self.alertController addAction:cancelAction];

        self.isCollected = YES;
        
    }else {
        BHSJK *sjk = [BHSJK shareInstance];
        [sjk deleteFrom:self.model.id];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"收藏01"] imageWithRenderingMode:1]style:UIBarButtonItemStylePlain target:self action:@selector(changeBarBtnItem:)];
        self.isCollected = NO;
        // 弹框
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"取消收藏" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertController animated:YES completion:nil];
        self.alertController = alertController;
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [self.alertController addAction:defaultAction];


    }
    
}
#pragma mark - TableView
-(void)creatTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64 - 49) style:0];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self.tableView release];

    [self.tableView jxl_setDayMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

#pragma mark - 头视图
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, 250 * lfheight)];
    self.tableView.tableHeaderView = self.headerView;
    [self.headerView release];
#pragma mark - 轮播图
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.headerView.frame.size.width, 240 * lfheight) delegate:self placeholderImage:nil];
    [self.headerView addSubview:_cycleScrollView];
#pragma mark - 地图分区
    [self.tableView registerClass:[BH_Map_TableViewCell class] forCellReuseIdentifier:@"firstCell"];
#pragma mark - 不可错过分区
    [self.tableView registerClass:[BH_D_Section_Details_firstSec_Details_TableViewCell class] forCellReuseIdentifier:@"secoundCell"];
    
}
#pragma mark - 分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
#pragma mark - 分区头标题高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 50 * lfheight;
}
#pragma mark - 分区头标题
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 50 * lfheight)];
    headView.backgroundColor = [UIColor whiteColor];

    [headView jxl_setDayMode:^(UIView *view) {
        //改变
        headView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        headView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, headView.frame.size.height / 2 - 30 * lfheight, headView.frame.size.width, 50 * lfheight)];
    [headView addSubview:label];
    
    if (section == 1) {
        label.text = @"不可错过";
        label.textAlignment = 1;

        [label jxl_setDayMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

    }
    return headView;
    
}
#pragma mark - 行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.arrModel.count;
    }
    
}
#pragma mark - cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
#pragma mark - 地图
        BH_Map_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
        
        
        return cell;
    }else{
#pragma mark - 不可错过
        BH_D_Section_Details_firstSec_Details_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secoundCell"];
        cell.backgroundColor = COLOR;
        
        cell.model = self.arrModel[indexPath.row];

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

        return cell;
    }
    
}
#pragma mark - 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 150 * lfheight;
    }
    return 220 * lfheight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        BH_Map_VC *mapVC = [[BH_Map_VC alloc] init];
        
        mapVC.strO = self.strOne;
        mapVC.strT = self.strTwo;
        
        [self.navigationController pushViewController:mapVC animated:YES];
        
    }
}
#pragma mark - 热门城市详情数据解析
-(void)getDataFromJson{
    [_arrCycleScrollView removeAllObjects];
    [_arrModel removeAllObjects];
    NSString *str = [NSString stringWithFormat:@"http://open.qyer.com/qyer/place/city_index?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_user_id=8145726&track_deviceid=867168024167485&track_app_version=6.9.5&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&lat=38.883472&lon=121.544473&city_id=%@&oauth_token=0196cd1c0c5bfebb5838b37c2310e594", _model.id];
    [BHNetTool GET:str body:nil headerFile:nil response:BHJSON success:^(id result) {
        NSDictionary *dic = (NSDictionary *)result;
        
        [BHCacheTool archiverObject:dic ByKey:@"detailsCache"WithPath:@"details.plist"];
        
        NSDictionary *dicData = dic[@"data"];
        self.strOne = dicData[@"lat"];
        self.strTwo = dicData[@"lon"];
        
#pragma mark - 轮播图
        NSMutableArray *arrPhotos = dicData[@"city_pic"];
        self.arrCycleScrollView = arrPhotos;
        self.cycleScrollView.imageURLStringsGroup = self.arrCycleScrollView;

#pragma mark - 不可错过
        NSMutableArray *arrNot_miss = dicData[@"not_miss"];
        for (NSDictionary *dic in arrNot_miss) {
             self.bigModel =
[[BH_D_Section_Details_FirstSec_Details_Model alloc] initWithDic:dic];
            [self.arrModel addObject:self.bigModel];
        }
                [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"detailsCache"WithPath:@"details.plist"];

        NSDictionary *dicData = dic[@"data"];
#pragma mark - 轮播图
        NSMutableArray *arrPhotos = dicData[@"city_pic"];
        self.arrCycleScrollView = arrPhotos;
        self.cycleScrollView.imageURLStringsGroup = self.arrCycleScrollView;
        
#pragma mark - 不可错过
        NSMutableArray *arrNot_miss = dicData[@"not_miss"];
        for (NSDictionary *dic in arrNot_miss) {
            self.bigModel =
            [[BH_D_Section_Details_FirstSec_Details_Model alloc] initWithDic:dic];
            [self.arrModel addObject:self.bigModel];
        }
        [self.tableView reloadData];

        
    }];
    
}

@end
