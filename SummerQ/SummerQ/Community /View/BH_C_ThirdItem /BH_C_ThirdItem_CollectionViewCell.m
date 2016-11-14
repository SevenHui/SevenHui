//
//  BH_C_ThirdItem_CollectionViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  寻旅伴

#import "BH_C_ThirdItem_CollectionViewCell.h"
#import "BHNetTool.h"
#import "BH_C_ThirdItem_TableViewCell.h"
#import "BH_C_ThirdItem_Model.h"
#import "BH_WKWebView_VC.h"
@interface BH_C_ThirdItem_CollectionViewCell ()
<UITableViewDataSource, UITableViewDelegate>

/**UITableView*/
@property (nonatomic, retain)UITableView *tableView;
/**数据数组*/
@property (nonatomic, retain)NSMutableArray *arrModel;
/**<#注释#>*/
@property (nonatomic, assign)NSInteger pNumber;

@end

@implementation BH_C_ThirdItem_CollectionViewCell
-(void)dealloc{
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
    [_tableView release];
    [_arrModel release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.pNumber = 1;
        
        // 数据数组
        self.arrModel = [NSMutableArray array];
        // 数据解析
        [self getDataFromJson:1];
                
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, HEIGHTSCREEN - 64 - 49) style:0];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:_tableView];
    [self.tableView release];
    [self.tableView setSeparatorColor:[UIColor clearColor]];

    [self.tableView jxl_setDayMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

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

    
    
    [self.tableView registerClass:[BH_C_ThirdItem_TableViewCell class] forCellReuseIdentifier:@"cell"];
    
}
#pragma mark - row个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrModel.count;
    
}
#pragma mark - cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BH_C_ThirdItem_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    
    cell.thirdItemModel = self.arrModel[indexPath.row];

    [cell jxl_setDayMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    
    return cell;
    
}
#pragma mark - 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200 * lfheight;
    
}
#pragma mark - 跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BH_WKWebView_VC *vc = [[BH_WKWebView_VC alloc] init];
    BH_C_ThirdItem_Model *model = [self.arrModel objectAtIndex:indexPath.row];
    vc.strURL = model.appview_url;
    [[self naviController] pushViewController:vc animated:YES];

}
#pragma mark - 当前控制器的导航控制器
- (UINavigationController*)naviController {
    
    for (UIView *next = [self superview]; next; next = next.superview) {
        
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            
            return (UINavigationController*)nextResponder;
        }
    }
    return nil;
}
#pragma mark - cell的动画效果
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CATransform3D transform = CATransform3DIdentity;
    // 渐变
    transform = CATransform3DRotate(transform, 0, 0, 0, 1 * lfheight);
    // 由小变大
    transform = CATransform3DScale(transform, 0, 0, 0);
    
    cell.layer.transform = transform;
    cell.layer.opacity = 0;
    
    [UIView animateWithDuration:0.9 animations:^{
        cell.layer.transform = CATransform3DIdentity;
        cell.layer.opacity = 1;
    }];
    
    
}
#pragma mark -- 下拉刷新
- (void)getUpData{
    [self.arrModel removeAllObjects];
    [self.tableView reloadData];
    [self getDataFromJson:1];
}
#pragma mark -- 上拉加载
- (void)getDownData{
    _pNumber++;
    [self getDataFromJson:_pNumber];
}
#pragma mark - 寻旅伴数据解析
-(void)getDataFromJson:(NSInteger)page{
    NSString *str = [NSString stringWithFormat:@"http://open.qyer.com/qyer/company/default_list?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=867168024167485&track_app_version=6.9.4&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&lat=38.883476&lon=121.54447&count=10&page=%ld", page];
    [BHNetTool GET:str body:nil headerFile:nil response:BHJSON success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        
        [BHCacheTool archiverObject:dic ByKey:@"thirdItemCache"WithPath:@"thirdItem.plist"];

        NSMutableArray *dataArr = dic[@"data"];
        for (NSDictionary *dic in dataArr) {
            BH_C_ThirdItem_Model *model = [[BH_C_ThirdItem_Model alloc] initWithDic:dic];
            [self.arrModel addObject:model];
            
        }
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"thirdItemCache"WithPath:@"thirdItem.plist"];

        NSMutableArray *dataArr = dic[@"data"];
        for (NSDictionary *dic in dataArr) {
            BH_C_ThirdItem_Model *model = [[BH_C_ThirdItem_Model alloc] initWithDic:dic];
            [self.arrModel addObject:model];
            
        }
        [self.tableView reloadData];

        
    }];
    
}
@end

