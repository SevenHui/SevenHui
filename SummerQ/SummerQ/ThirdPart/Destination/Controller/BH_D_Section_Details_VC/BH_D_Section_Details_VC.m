//
//  BH_D_Section_Details_VC.m
//  SummerQ
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  目的地详情

#import "BH_D_Section_Details_VC.h"
#import "BH_D_Section_Details_FirstSection_TableViewCell.h"
#import "BH_D_Section_Details_SecoundSection_TableViewCell.h"
#import "BH_D_Section_Details_Model.h"
#import "BH_D_Section_Details_HotCity_Model.h"
#import "BH_D_Section_Details_Discount_Model.h"
#import "BH_D_Section_Details_FirstSection_VC.h"
#import "BH_D_Section_Details_FirstSec_Details_VC.h"
#import "BH_D_Section_WU_VC.h"
@interface BH_D_Section_Details_VC ()
<UITableViewDataSource, UITableViewDelegate>

/**注释*/
@property (nonatomic, retain)UITableView *tableView;
/**热门城市数据数组*/
@property (nonatomic, retain)NSMutableArray *arrHot_city;
/**超值自由行数据数组*/
@property (nonatomic, retain)NSMutableArray *arrNew_Discount;

@end

@implementation BH_D_Section_Details_VC
-(void)dealloc{
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
    [_arrNew_Discount release];
    [_arrHot_city release];
    [_tableView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self config];
    [self getDataFromJson];
    [self creatTableView];
        
}
-(void)config{
    self.view.backgroundColor = [UIColor whiteColor];
    // 热门城市数组
    self.arrHot_city = [NSMutableArray array];
    // 超值自由行
    self.arrNew_Discount = [NSMutableArray array];
#pragma 自定义导航返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回键"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
}
#pragma mark - 返回按钮
- (void)leftAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}
-(void)creatTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64 - 49) style:0];
    self.tableView.backgroundColor = [UIColor whiteColor];
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

    [self.tableView registerClass:[BH_D_Section_Details_FirstSection_TableViewCell class] forCellReuseIdentifier:@"firstCell"];
    [self.tableView registerClass:[BH_D_Section_Details_SecoundSection_TableViewCell class] forCellReuseIdentifier:@"secoundCell"];
    
    
}
#pragma mark - 分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
#pragma mark - 分区头标题高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
        return 50 * lfheight;
}
#pragma mark - 分区头标题
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 50 * lfheight)];
    headView.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, headView.frame.size.height / 2 - 25 * lfheight, headView.frame.size.width, 50 * lfheight)];
    [headView addSubview:label];

    
    if (section == 0) {
        label.text = @"热门城市";

        [label jxl_setDayMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(headView.frame.size.width * 0.8, headView.frame.size.height / 2 - 25 * lfheight, headView.frame.size.width * 0.2, 50 * lfheight);
//        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:@"查看全部" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        [headView addSubview:btn];

//        UITapGestureRecognizer *firstTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(firstTapAction:)];
//        [headView addGestureRecognizer:firstTap];
        
    }else{
        label.text = @"超值自由行";

        [label jxl_setDayMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

    }
    label.font = [UIFont systemFontOfSize:17 * lfweight];
    
    return headView;
    
}
-(void)btnAction{
    BH_D_Section_Details_FirstSection_VC *firstSectionVC = [[BH_D_Section_Details_FirstSection_VC alloc] init];
    [self.navigationController pushViewController:firstSectionVC animated:YES];

}
#pragma mark - 行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return self.arrNew_Discount.count;
    
}
#pragma mark - cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
#pragma mark - 热门城市
        BH_D_Section_Details_FirstSection_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
        cell.array_Hot = self.arrHot_city;

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
        }];

        return cell;
    }
#pragma mark - 超值自由行
    BH_D_Section_Details_SecoundSection_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secoundCell"];
    
    cell.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    
    cell.discountModel = self.arrNew_Discount[indexPath.row];

    [cell jxl_setDayMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    return cell;
}
#pragma mark - 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 230 * lfheight;
    }
    return 100 * lfheight;
}
#pragma mark - 跳转界面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1) {
        BH_D_Section_WU_VC *vc = [[BH_D_Section_WU_VC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
#pragma mark - 目的地详情数据解析
-(void)getDataFromJson{
    [_arrHot_city removeAllObjects];
    [_arrNew_Discount removeAllObjects];
    NSString *str = [NSString stringWithFormat:@"http://open.qyer.com/qyer/footprint/country_detail?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_user_id=8145726&track_deviceid=867168024167485&track_app_version=6.9.5&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&lat=38.883472&lon=121.544473&country_id=%@&oauth_token=0196cd1c0c5bfebb5838b37c2310e594",self.ID];
   
    [BHNetTool GET:str body:nil headerFile:nil response:BHJSON success:^(id result) {
        NSDictionary *dic = (NSDictionary *)result;
        
        [BHCacheTool archiverObject:dic ByKey:@"cityDicCountCache"WithPath:@"cityDicCount.plist"];

        NSDictionary *dicData = dic[@"data"];
#pragma mark - 热门城市
        NSMutableArray *arrCity = dicData[@"hot_city"];
        for (NSDictionary *dic in arrCity) {
            BH_D_Section_Details_HotCity_Model *model = [[BH_D_Section_Details_HotCity_Model alloc] initWithDic:dic];
            [self.arrHot_city addObject:model];
        }
#pragma mark - 超值自由行
        NSMutableArray *arrDiscount = dicData[@"new_discount"];
        for (NSDictionary *dic in arrDiscount) {
            BH_D_Section_Details_Discount_Model *model = [[BH_D_Section_Details_Discount_Model alloc] initWithDic:dic];
            [self.arrNew_Discount addObject:model];
        }
        
        [self.tableView reloadData];
        
    }failure:^(NSError *error) {
        
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"cityDicCountCache"WithPath:@"cityDicCount.plist"];

        NSDictionary *dicData = dic[@"data"];
#pragma mark - 热门城市
        NSMutableArray *arrCity = dicData[@"hot_city"];
        for (NSDictionary *dic in arrCity) {
            BH_D_Section_Details_HotCity_Model *model = [[BH_D_Section_Details_HotCity_Model alloc] initWithDic:dic];
            [self.arrHot_city addObject:model];
        }
#pragma mark - 超值自由行
        NSMutableArray *arrDiscount = dicData[@"new_discount"];
        for (NSDictionary *dic in arrDiscount) {
            BH_D_Section_Details_Discount_Model *model = [[BH_D_Section_Details_Discount_Model alloc] initWithDic:dic];
            [self.arrNew_Discount addObject:model];
        }
        
        [self.tableView reloadData];

        
    }];
    
}


@end
