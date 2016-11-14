//
//  BH_R_Discount_VC.m
//  SummerQ
//
//  Created by apple on 16/7/20.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  抢折扣

#import "BH_R_Discount_VC.h"
#import "BH_R_DisCount_FirstSection_TableViewCell.h"
#import "BH_R_DisCount_SecondSection_TableViewCell.h"
#import "BH_R_DisCount_ThirdSection_TableViewCell.h"
#import "BH_R_DisCount_FourSection_TableViewCell.h"
#import "BH_R_Discount_Model.h"
@interface BH_R_Discount_VC ()
<UITableViewDataSource, UITableViewDelegate>
/**UITableView*/
@property (nonatomic, retain)UITableView *tableView;
/**分区头标题*/
@property (nonatomic, retain)NSArray *arrTitleForHeader;
/**第一分区数据数组*/
@property (nonatomic, retain)NSMutableArray *arrFirstModel;
/**第二分区数据数组*/
@property (nonatomic, retain)NSMutableArray *arrSecondModel;
/**第三分区数据数组*/
@property (nonatomic, retain)NSMutableArray *arrThirdModel;
/**有好货数据数组*/
@property (nonatomic, retain)NSMutableArray *arrFourModel;
/**<#注释#>*/
@property (nonatomic, retain)NSMutableArray *arrHot_area;

@end

@implementation BH_R_Discount_VC
-(void)dealloc{
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
    [_arrHot_area release];
    [_arrFourModel release];
    [_arrThirdModel release];
    [_arrSecondModel release];
    [_arrFirstModel release];
    [_arrTitleForHeader release];
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
    // 分区头标题
    self.arrTitleForHeader = [NSArray array];
    // 分区数据数组
    self.arrFirstModel = [NSMutableArray array];
    self.arrSecondModel = [NSMutableArray array];
    self.arrThirdModel = [NSMutableArray array];
    self.arrFourModel = [NSMutableArray array];
#pragma 自定义导航返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回键"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
}
#pragma mark - 返回按钮
- (void)leftAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)creatTableView{
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
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

#pragma mark - 东南亚
    [self.tableView registerClass:[BH_R_DisCount_FirstSection_TableViewCell class] forCellReuseIdentifier:@"firstCell"];
#pragma mark - 日韩
    [self.tableView registerClass:[BH_R_DisCount_SecondSection_TableViewCell class] forCellReuseIdentifier:@"secondCell"];
#pragma mark - 港澳台
    [self.tableView registerClass:[BH_R_DisCount_ThirdSection_TableViewCell class] forCellReuseIdentifier:@"thirdCell"];
#pragma mark - 有好货
    [self.tableView registerClass:[BH_R_DisCount_FourSection_TableViewCell class] forCellReuseIdentifier:@"fourCell"];
    
    
}
#pragma mark - 分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
#pragma mark - 分区头标题高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
#pragma mark - 分区头标题
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 50 * lfheight)];
    headView.backgroundColor = [UIColor whiteColor];

    [headView jxl_setDayMode:^(UIView *view) {
        //改变
        headView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        headView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, headView.frame.size.height / 2 - 30 * lfheight, headView.frame.size.width, 50 * lfheight)];
    [headView addSubview:label];
    
    
    if (section == 0) {
        label.text  = @"东南亚";
        [label jxl_setDayMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

    }
    if (section == 1) {
        label.text = @"日韩";

        [label jxl_setDayMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

    }
    if (section == 2) {
        label.text = @"港澳台";

        [label jxl_setDayMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            label.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

    }
    if (section == 3) {
        label.text = @"有好货";
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
// 行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.arrFirstModel.count;
    }else if (section == 1){
        return self.arrSecondModel.count;
    }else if (section == 2){
        return self.arrThirdModel.count;
    }else{
        return 1;
    }
    
}
// cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
#pragma mark - 东南亚
        BH_R_DisCount_FirstSection_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
    
//        cell.backgroundColor = [UIColor orangeColor];
        
        cell.discountModel = self.arrFirstModel[indexPath.row];

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

        return cell;
    
    }
    if (indexPath.section == 1) {
#pragma mark - 日韩
        BH_R_DisCount_SecondSection_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondCell"];

//        cell.backgroundColor = [UIColor redColor];
        
        cell.discountSecondModel = self.arrSecondModel[indexPath.row];
        

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

        return cell;
        
    }
    if (indexPath.section == 2) {
#pragma mark - 港澳台
        BH_R_DisCount_ThirdSection_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"thirdCell"];
        
//        cell.backgroundColor = [UIColor yellowColor];
        
        cell.discountThirdModel = self.arrThirdModel[indexPath.row];

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

        return cell;
        
    }
#pragma mark - 有好货
    BH_R_DisCount_FourSection_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourCell"];
    
//    cell.backgroundColor = [UIColor orangeColor];
    
    cell.arrGoodModel = self.arrFourModel;

    [cell jxl_setDayMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    return cell;
    
}
// 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 120 * lfheight;
    }else if (indexPath.section == 1){
        return 120 * lfheight;
    }else if (indexPath.section == 2){
        return 120 * lfheight;
    }else{
        return 700 * lfheight;
    }
}
#pragma mark - 抢折扣数据解析
-(void)getDataFromJson{
    [self.arrFirstModel removeAllObjects];
    [self.arrSecondModel removeAllObjects];
    [self.arrThirdModel removeAllObjects];
    [self.arrFourModel removeAllObjects];
    
    NSString *str = @"http://open.qyer.com/qyer/discount/zk/discount_index?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=867168024167485&track_app_version=6.9.4&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&lat=38.883483&lon=121.544454";
    [BHNetTool GET:str body:nil headerFile:nil response:BHJSON success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        [BHCacheTool archiverObject:dic ByKey:@"modelCache"WithPath:@"model.plist"];
        NSDictionary *dicData = dic[@"data"];

        self.arrHot_area = dicData[@"hot_area"];
        
        NSDictionary *dicOne = [self.arrHot_area objectAtIndex:0];
        NSArray *arrOne = dicOne[@"list"];
        for (NSDictionary *dict in arrOne) {
                BH_R_Discount_Model *model = [[BH_R_Discount_Model alloc] initWithDic:dict];
                [self.arrFirstModel addObject:model];
        }
        NSDictionary *dicTwo = [self.arrHot_area objectAtIndex:1];
        NSArray *arrTwo = dicTwo[@"list"];
        for (NSDictionary *dict in arrTwo) {
            BH_R_Discount_Model *model = [[BH_R_Discount_Model alloc] initWithDic:dict];
            [self.arrSecondModel addObject:model];
        }
        NSDictionary *dicThird = [self.arrHot_area objectAtIndex:2];
        NSArray *arrThird = dicThird[@"list"];
        for (NSDictionary *dict in arrThird) {
            BH_R_Discount_Model *model = [[BH_R_Discount_Model alloc] initWithDic:dict];
            [self.arrThirdModel addObject:model];
        }
#pragma mark - 好货
        NSMutableArray *arrHot_goods  = dicData[@"hot_goods"];
        for (NSDictionary *dic in arrHot_goods) {
            BH_R_Discount_Model *model = [[BH_R_Discount_Model alloc] initWithDic:dic];
            [self.arrFourModel addObject:model];
        }
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"modelCache"WithPath:@"model.plist"];
        NSDictionary *dicData = dic[@"data"];

        self.arrHot_area = dicData[@"hot_area"];
        
        NSDictionary *dicOne = [self.arrHot_area objectAtIndex:0];
        NSArray *arrOne = dicOne[@"list"];
        for (NSDictionary *dict in arrOne) {
            BH_R_Discount_Model *model = [[BH_R_Discount_Model alloc] initWithDic:dict];
            [self.arrFirstModel addObject:model];
        }
        NSDictionary *dicTwo = [self.arrHot_area objectAtIndex:1];
        NSArray *arrTwo = dicTwo[@"list"];
        for (NSDictionary *dict in arrTwo) {
            BH_R_Discount_Model *model = [[BH_R_Discount_Model alloc] initWithDic:dict];
            [self.arrSecondModel addObject:model];
        }
        NSDictionary *dicThird = [self.arrHot_area objectAtIndex:2];
        NSArray *arrThird = dicThird[@"list"];
        for (NSDictionary *dict in arrThird) {
            BH_R_Discount_Model *model = [[BH_R_Discount_Model alloc] initWithDic:dict];
            [self.arrThirdModel addObject:model];
        }
#pragma mark - 好货
        NSMutableArray *arrHot_goods  = dicData[@"hot_goods"];
        for (NSDictionary *dic in arrHot_goods) {
            BH_R_Discount_Model *model = [[BH_R_Discount_Model alloc] initWithDic:dic];
            [self.arrFourModel addObject:model];
        }
        
        [self.tableView reloadData];

    }];
}
//#pragma mark - 抢折扣热门城市webView数据解析
//-(void)getDataFromJsonOfHotWebView{
//    [self.arrHotWebView removeAllObjects];
//    NSString *str = @"http://open.qyer.com/lastminute/get_detail?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_user_id=8145726&track_deviceid=867168024167485&track_app_version=6.9.5&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1469634901498&lat=38.883481&lon=121.544475&id=62545&oauth_token=4ca7a559d2651031ba4cef1a887f0fc6";
//    [BHNetTool GET:str body:nil headerFile:nil response:BHJSON success:^(id result) {
//        NSDictionary *dic = (NSDictionary *)result;
//        
//        [BHCacheTool archiverObject:dic ByKey:@"hotCache"WithPath:@"hot.plist"];
//        
//        NSDictionary *dicData = dic[@"data"];
//        [self.arrHotWebView addObject:[dicData objectForKey:@"app_url"]];
//        
//        [self.tableView reloadData];
//        
//    } failure:^(NSError *error) {
//        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"hotCache"WithPath:@"hot.plist"];
//        
//        NSDictionary *dicData = dic[@"data"];
//        [self.arrHotWebView addObject:[dicData objectForKey:@"app_url"]];
//        
//        [self.tableView reloadData];
//
//        
//    }];
//}
//#pragma mark - 有好货webView数据解析
//-(void)getDataFromJsonOfGoodWebView{
//    [self.arrGoodWebView removeAllObjects];
//    NSString *str = @"http://open.qyer.com/lastminute/get_detail?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_user_id=8145726&track_deviceid=867168024167485&track_app_version=6.9.5&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1469634901498&lat=38.883481&lon=121.544475&id=81006&oauth_token=4ca7a559d2651031ba4cef1a887f0fc6";
//    [BHNetTool GET:str body:nil headerFile:nil response:BHJSON success:^(id result) {
//        NSDictionary *dic = (NSDictionary *)result;
//        
//        [BHCacheTool archiverObject:dic ByKey:@"goodCache"WithPath:@"good.plist"];
//
//        NSDictionary *dicData = dic[@"data"];
//        [self.arrGoodWebView addObject:[dicData objectForKey:@"app_url"]];
//        
//        [self.tableView reloadData];
//        
//    } failure:^(NSError *error) {
//        
//        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"goodCache"WithPath:@"good.plist"];
//        
//        NSDictionary *dicData = dic[@"data"];
//        [self.arrGoodWebView addObject:[dicData objectForKey:@"app_url"]];
//        
//        [self.tableView reloadData];
//
//        
//    }];
//    
//}
//
//
//
@end
