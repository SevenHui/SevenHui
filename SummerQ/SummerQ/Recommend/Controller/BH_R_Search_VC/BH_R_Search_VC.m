//
//  BH_R_Search_VC.m
//  SummerQ
//
//  Created by apple on 16/7/21.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  导航栏搜索

#import "BH_R_Search_VC.h"
#import "BHSearchBar.h"
#import "BH_R_Search_TableViewCell.h"
#import "BH_R_Search_Model.h"
#import "BH_D_Section_Details_FirstSec_Details_VC.h"
#import "BH_D_Section_Details_HotCity_Model.h"
@interface BH_R_Search_VC ()
<UITableViewDataSource,UITableViewDelegate,
UISearchBarDelegate>
/**tableView*/
@property (nonatomic, retain)UITableView *tableView;
/**数据数组*/
@property (nonatomic, retain)NSMutableArray *arrModel;
/**搜索*/
@property (nonatomic, retain)BHSearchBar *searchBar;
/**弹框*/
@property(nonatomic,retain)UIAlertController *alertController;

@end

@implementation BH_R_Search_VC
-(void)dealloc{
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
    [_alertController release];
    [_searchBar release];
    [_arrModel release];
    [_tableView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
    [self creatTableView];
    [self creatSearchBar];
    
}
-(void)config{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.arrModel = [NSMutableArray array];

    [self.view jxl_setDayMode:^(UIView *view) {
        //改变
        self.view.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.view.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    
#pragma 自定义导航返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回键"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(didClickedButton:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
}
#pragma mark - 返回按钮
- (void)leftAction:(UIBarButtonItem *)sender{
    [_searchBar removeFromSuperview];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)creatTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, 0) style:0];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    [_tableView release];

    [self.tableView jxl_setDayMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    [self.tableView registerClass:[BH_R_Search_TableViewCell class] forCellReuseIdentifier:@"cell"];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrModel.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BH_R_Search_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    BH_R_Search_Model *model = [self.arrModel objectAtIndex:indexPath.row];
    cell.string = self.searchBar.text;
    cell.model = model;

    [cell jxl_setDayMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100 * lfheight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BH_D_Section_Details_FirstSec_Details_VC *vc = [[BH_D_Section_Details_FirstSec_Details_VC alloc] init];
    
    BH_R_Search_Model *model = self.arrModel[indexPath.row];
    BH_D_Section_Details_HotCity_Model *models = [[BH_D_Section_Details_HotCity_Model alloc] init];
    
    models.id = [NSString stringWithFormat:@"%ld", model.id];
    vc.model = models;
    [models release];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark - SearchBar
- (void)creatSearchBar{
    UIView *searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, 44 * lfheight)];
    self.searchBar = [[BHSearchBar alloc] init];
    self.searchBar.frame = CGRectMake(0, 0, WIDTHSCREEN - 150 * lfweight, 44 * lfheight);
    self.searchBar.keyboardType = UIKeyboardTypeDefault;
    self.searchBar.barStyle = UIBarStyleDefault;
    self.searchBar.placeholder = @"请输入搜索内容";
    self.searchBar.delegate = self;
    [searchView addSubview:_searchBar];
    [_searchBar release];
    self.navigationItem.titleView = searchView;
    
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self getData:searchBar.text];
    
    self.tableView.frame = CGRectMake(0, 0, WIDTHSCREEN, HEIGHTSCREEN - 64);
    [self.tableView reloadData];
    [searchBar resignFirstResponder];
    
}
#pragma mark - 右侧按钮
- (void)didClickedButton:(UITabBarItem *)sender{
    [self.arrModel removeAllObjects];
    self.tableView.frame = CGRectMake(0, 0, WIDTHSCREEN, 0);
    [self.tableView reloadData];
}
#pragma mark - 搜索数据解析
- (void)getData:(NSString *)word{
    [self.arrModel removeAllObjects];
    NSString *str = [NSString stringWithFormat:@"http://open.qyer.com/qyer/search/index?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&keyword=%@&lat=25.04427337646484&lon=121.5138320922852&page=1&place_field=country|city|poi&track_app_channel=App Store&track_app_version=6.9.0&track_device_info=iPhone5,3&track_deviceid=B6F8674A-04C4-445C-95A0-0C7BE992ACF2&track_os=ios 9.3.1&type=place&v=1", word];
    [BHNetTool GET:str body:nil headerFile:nil response:BHJSON success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        NSDictionary *dicData = dic[@"data"];
        NSArray *tempArray = [dicData objectForKey:@"entry"];
        for (NSDictionary *dic in tempArray) {
            BH_R_Search_Model *model = [[BH_R_Search_Model alloc] initWithDic:dic];
            [self.arrModel addObject:model];
            [model release];
        }
        if (self.arrModel.count == 0) {
            // 弹框
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入搜索内容" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alertController animated:YES completion:nil];
            self.alertController = alertController;
            
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [self.alertController addAction:defaultAction];
        }
        else{
            
            [self.tableView reloadData];
        }

        
    } failure:^(NSError *error) {
        
        
    }];
    
}


@end
