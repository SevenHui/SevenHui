//
//  BH_Recommend_VC.m
//  SummerQ
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 沐沐`柒. All rights reserved.

//  Recommend 推荐 主VC

#import "BH_Recommend_VC.h"
#import "SDCycleScrollView.h"
#import "BH_R_Search_VC.h"
#import "BH_R_HeaderView.h"
#import "BH_R_FirstCell_TableViewCell.h"
#import "BH_R_SecondCell_TableViewCell.h"
#import "BH_R_SecondCell_Model.h"
#import "BH_R_ThirdCell_TableViewCell.h"
#import "BH_R_ThirdCell_Model.h"
#import "BH_R_AllFirstCell_VC.h"
#import "BH_R_Discount_VC.h"
@interface BH_Recommend_VC ()
<UITableViewDataSource,UITableViewDelegate,
SDCycleScrollViewDelegate>

/**TableView*/
@property (nonatomic, retain)UITableView *tableView;
/**头视图_View*/
@property (nonatomic, retain)UIView *headerView;
/**头视图_轮播图_三方*/
@property (nonatomic, retain)SDCycleScrollView *cycleScrollView;
/**头视图_轮播图数据数组*/
@property (nonatomic, retain)NSMutableArray *arrCycleScrollView;
/**头视图_自定义CollectionView*/
@property (nonatomic, retain)BH_R_HeaderView *collectionView;
/**分区头标题数组*/
@property (nonatomic, retain)NSArray *arrSectionHeader;
/**第一分区数据数组*/
@property (nonatomic, retain)NSMutableArray *arrModel;
/**第一分区webView*/
@property (nonatomic, retain)NSMutableArray *arrFirstUrlModel;
/**第二分区头视图数据数组*/
@property (nonatomic, retain)NSMutableArray *arrDis_subModel;
/**第二分区数据数组*/
@property (nonatomic, retain)NSMutableArray *arrSecondModel;
/**第三分区数据数组*/
@property (nonatomic, retain)NSMutableArray *arrDataModel;
/**<#注释#>*/
@property (nonatomic, retain)UIView *viewForHeader;
/**<#注释#>*/
@property (nonatomic, assign)NSInteger pNumber;

@end

@implementation BH_Recommend_VC
-(void)dealloc{
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
    [_viewForHeader release];
    [_arrFirstUrlModel release];
    [_arrDataModel release];
    [_arrDis_subModel release];
    [_arrSecondModel release];
    [_arrModel release];
    [_arrSectionHeader release];
    [_collectionView release];
    [_cycleScrollView release];
    [_arrCycleScrollView release];
    [_headerView release];
    [_tableView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    [self getDataFromJson];
    [self getDatafromJsonOfThirdCell:1];
    [self creatTableView];
    
}
-(void)config{
    
    self.pNumber = 1;
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.35 green:0.71 blue:0.54 alpha:1.00];
    self.title = @"推荐";
    
    self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
#pragma mark - 导航栏搜索
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAction)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    // 轮播图数据数组
    self.arrCycleScrollView = [NSMutableArray array];
    // 第一分区数据数组
    self.arrModel = [NSMutableArray array];
    // 第一分区url数据数组
    self.arrFirstUrlModel = [NSMutableArray array];
    // 第二分区数据数组
    self.arrSecondModel = [NSMutableArray array];
    // 第二分区头视图数据数组
    self.arrDis_subModel = [NSMutableArray array];
    // 第三分区数据数组
    self.arrDataModel = [NSMutableArray array];
    
}
#pragma mark - 导航栏搜索
-(void)searchAction{
    BH_R_Search_VC *searchVC = [[BH_R_Search_VC alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
    
}
#pragma mark - UITableView
-(void)creatTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64 - 49) style:0];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:_tableView];
    [self.tableView release];

    //上拉加载
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getUpData];
        [self.tableView.mj_header endRefreshing];
    }];
    //下拉刷新
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self getDownData];
        [self.tableView.mj_footer endRefreshing];
    }];
    
    
    [self.tableView jxl_setDayMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

#pragma mark - 头视图_View
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, 300 * lfheight)];
    self.headerView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];

    self.tableView.tableHeaderView = _headerView;
    [self.headerView release];

#pragma mark - 头视图_轮播图_三方
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, WIDTHSCREEN, 200 * lfheight) delegate:self placeholderImage:nil];
    [self.headerView addSubview:_cycleScrollView];
#pragma mark - 头视图_自定义CollectionView
    self.collectionView = [[BH_R_HeaderView alloc] initWithFrame:CGRectMake(0, 200 * lfheight, WIDTHSCREEN, 100 * lfheight)];
    [self.tableView addSubview:_collectionView];
    [self.collectionView release];
    
#pragma mark - 第一分区 发现下一站
    [self.tableView registerClass:[BH_R_FirstCell_TableViewCell class] forCellReuseIdentifier:@"firstCell"];
#pragma mark - 第二分区 抢特价折扣
    [self.tableView registerClass:[BH_R_SecondCell_TableViewCell class] forCellReuseIdentifier:@"secondCell"];
#pragma mark - 第三分区 看热门游记
    [self.tableView registerClass:[BH_R_ThirdCell_TableViewCell class] forCellReuseIdentifier:@"thirdCell"];
    
    
}
#pragma mark - UITableViewDataSource的协议方法
#pragma mark - 分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
#pragma mark - 分区头标题高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50 * lfheight;
}
#pragma mark - 分区头标题内容
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    self.viewForHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 50 * lfheight)];
    self.viewForHeader.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.viewForHeader.frame.size.height / 2 - 25 * lfheight, self.viewForHeader.frame.size.width, 50 * lfheight)];

    [self.viewForHeader addSubview:label];
    
    if (section == 0) {
        label.text = @"发现下一站";
        label.textAlignment = 1;

        [label jxl_setDayMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

        
    }
    if (section == 1) {
        label.text = @"抢特价折扣";
        label.textAlignment = 1;

        [label jxl_setDayMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

    }
    if (section == 2) {
        label.text = @"看热门游记";
        label.textAlignment = 1;

        [label jxl_setDayMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

    }

    return self.viewForHeader;
    
}
#pragma mark - 行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
        
    }else if (section == 1){
        return 1;
        
    }else{
        return self.arrDataModel.count;
        
    }
    
}
#pragma mark - 行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
#pragma mark - 第一分区 发现下一站 cell
        BH_R_FirstCell_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
        
        if (self.arrModel.count != 0) {
            cell.arr = self.arrModel;
            cell.array = self.arrFirstUrlModel;
            
        }
#pragma mark - block跳转
        void(^allFirstCell)(BH_R_AllFirstCell_VC *) = ^(BH_R_AllFirstCell_VC *allFirstCell){
            
            [self.navigationController pushViewController:allFirstCell animated:YES];
        };
        cell.block = allFirstCell;
        
        return cell;
        
    }else if (indexPath.section == 1){
#pragma mark - 第二分区 抢特价折扣 cell
        BH_R_SecondCell_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondCell"];
        // 头视图
        if (self.arrDis_subModel.count != 0) {
            cell.arrDiscount_subject = self.arrDis_subModel;
        }
        //
        if (self.arrSecondModel.count != 0) {
            cell.modelArray = self.arrSecondModel;
        }
#pragma mark - 尾视图 block跳转
        void(^discountVC)(BH_R_Discount_VC *) = ^(BH_R_Discount_VC *discountVC){
            [self.navigationController pushViewController:discountVC animated:YES];
        };
        cell.block = discountVC;
        
        return cell;
        
    }else{
#pragma mark - 第三分区 看热门游记 cell
        BH_R_ThirdCell_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"thirdCell"];
        
//        cell.backgroundColor = COLOR;
        
        cell.thirdCell_Model = self.arrDataModel[indexPath.row];
        
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 350 * lfheight;
        
    }else if (indexPath.section == 1){
        return 460 * lfheight;
        
    }else{
        return 140 * lfheight;
        
    }
    
}
#pragma mark - UITableView点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
#pragma mark - 第三分区跳转
        BH_WKWebView_VC *wkWebViewVC = [[BH_WKWebView_VC alloc] init];
        BH_R_ThirdCell_Model *model = [self.arrDataModel objectAtIndex:indexPath.row];
        wkWebViewVC.strURL = model.view_url;
        [self.navigationController pushViewController:wkWebViewVC animated:YES];
    }
    
}
#pragma mark - 头视图,分区一,分区二数据
-(void)getDataFromJson{
    [_arrCycleScrollView removeAllObjects];
    [_arrModel removeAllObjects];
    [_arrFirstUrlModel removeAllObjects];
    [_arrDis_subModel removeAllObjects];
    [_arrSecondModel removeAllObjects];
    
    [BHNetTool GET:@"http://open.qyer.com/qyer/recommands/entry?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=867168024167485&track_app_version=6.9.4&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&channel=oppo" body:nil headerFile:nil response:BHJSON success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        
        [BHCacheTool archiverObject:dic ByKey:@"recommandsUpCache"WithPath:@"recommandsUp.plist"];
        
        NSDictionary *dicData = dic[@"data"];
#pragma mark - 轮播图 数据解析
        NSArray *arrSlide = dicData[@"slide"];
        for (NSDictionary *dic in arrSlide) {
            [self.arrCycleScrollView addObject:[dic objectForKey:@"photo"]];
        }
        self.cycleScrollView.imageURLStringsGroup = self.arrCycleScrollView;
#pragma mark - 第一分区 发现下一站 数据解析
        NSArray *arrSubject = dicData[@"subject"];
        for (NSDictionary *dic in arrSubject) {
            [self.arrModel addObject:[dic objectForKey:@"photo"]];
            [self.arrFirstUrlModel addObject:[dic objectForKey:@"url"]];
        }
#pragma mark - 第二分区 抢特价折扣 数据解析
        NSArray *arrDiscount = dicData[@"discount"];
        for (NSDictionary *dic in arrDiscount) {
            BH_R_SecondCell_Model *model = [[BH_R_SecondCell_Model alloc] initWithDic:dic];
            [self.arrSecondModel addObject:model];
        }
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"recommandsUpCache"WithPath:@"recommandsUp.plist"];

        NSDictionary *dicData = dic[@"data"];
#pragma mark - 轮播图 数据解析
        NSArray *arrSlide = dicData[@"slide"];
        for (NSDictionary *dic in arrSlide) {
            [self.arrCycleScrollView addObject:[dic objectForKey:@"photo"]];
        }
        self.cycleScrollView.imageURLStringsGroup = self.arrCycleScrollView;
#pragma mark - 第一分区 发现下一站 数据解析
        NSArray *arrSubject = dicData[@"subject"];
        for (NSDictionary *dic in arrSubject) {
            [self.arrModel addObject:[dic objectForKey:@"photo"]];
            [self.arrFirstUrlModel addObject:[dic objectForKey:@"url"]];
        }
#pragma mark - 第二分区 抢特价折扣 头视图 数据解析
        NSArray *arrDis_sub = dicData[@"discount_subject"];
        for (NSDictionary *dic in arrDis_sub) {
            [self.arrDis_subModel addObject:[dic objectForKey:@"photo"]];
        }
#pragma mark - 第二分区 抢特价折扣 数据解析
        NSArray *arrDiscount = dicData[@"discount"];
        for (NSDictionary *dic in arrDiscount) {
            BH_R_SecondCell_Model *model = [[BH_R_SecondCell_Model alloc] initWithDic:dic];
            [self.arrSecondModel addObject:model];
        }
        
        [self.tableView reloadData];

        
    }];
    
}
#pragma mark -- 下拉刷新
- (void)getUpData{
    // 首先清空
    [self.arrDataModel removeAllObjects];
    [self.tableView reloadData];
    [self getDatafromJsonOfThirdCell:1];
}
#pragma mark -- 上拉加载
- (void)getDownData{
    _pNumber++;
    [self getDatafromJsonOfThirdCell:_pNumber];
}
#pragma mark - 第三分区 看热门游记 数据解析
-(void)getDatafromJsonOfThirdCell:(NSInteger)page{
    NSString *string = [NSString stringWithFormat:@"http://open.qyer.com/qyer/recommands/trip?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=867168024167485&track_app_version=6.9.4&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&lat=38.88353&lon=121.544509&type=index&page=%ld&count=10",page];
    [BHNetTool GET:string body:nil headerFile:nil response:BHJSON success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        
        [BHCacheTool archiverObject:dic ByKey:@"recommandsDownCache"WithPath:@"recommandsDown.plist"];
        
        NSMutableArray *arrData = dic[@"data"];
        for (NSDictionary *dic in arrData) {
            BH_R_ThirdCell_Model *model = [[BH_R_ThirdCell_Model alloc] initWithDic:dic];
            [self.arrDataModel addObject:model];
        }
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"hunterCache"WithPath:@"hunter.plist"];
        
        NSMutableArray *arrData = dic[@"data"];
        for (NSDictionary *dic in arrData) {
            BH_R_ThirdCell_Model *model = [[BH_R_ThirdCell_Model alloc] initWithDic:dic];
            [self.arrDataModel addObject:model];
        }
        
        [self.tableView reloadData];
        
    }];
}













@end
