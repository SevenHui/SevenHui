//
//  BH_C_FirstItem_CollectionViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  热议

#import "BH_C_FirstItem_CollectionViewCell.h"
#import "BHNetTool.h"
#import "BH_C_ZeroBigPic_TableViewCell.h"
#import "BH_C_OneBigPic_TableViewCell.h"
#import "BH_C_TwoBigPic_TableViewCell.h"
#import "BH_C_ThreeBigPic_TableViewCell.h"
#import "BH_C_FirstItem_Model.h"
#import "BH_WKWebView_VC.h"
@interface BH_C_FirstItem_CollectionViewCell ()
<UITableViewDataSource, UITableViewDelegate>

/**UITableView*/
@property (nonatomic, retain)UITableView *tableView;
/**数据数组*/
@property (nonatomic, retain)NSMutableArray *arrModel;
/**<#注释#>*/
@property (nonatomic, assign)NSInteger pNumber;

@end

@implementation BH_C_FirstItem_CollectionViewCell
-(void)dealloc{
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
    [_tableView release];
    [_arrModel release];
    [_tableView release];
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
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, HEIGHTSCREEN - 64 - 49) style:0];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
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

    
    [self.tableView registerClass:[BH_C_ZeroBigPic_TableViewCell class] forCellReuseIdentifier:@"zeroCell"];
    [self.tableView registerClass:[BH_C_OneBigPic_TableViewCell class] forCellReuseIdentifier:@"oneCell"];
    [self.tableView registerClass:[BH_C_TwoBigPic_TableViewCell class] forCellReuseIdentifier:@"twoCell"];
    [self.tableView registerClass:[BH_C_ThreeBigPic_TableViewCell class] forCellReuseIdentifier:@"threeCell"];
    

}
#pragma mark - row个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrModel.count;
    
}
#pragma mark - cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BH_C_FirstItem_Model *model = self.arrModel[indexPath.row];
    
    if (model.bigpic_arr.count == 0) {
#pragma mark - 没有图片的cell
        BH_C_ZeroBigPic_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zeroCell"];
        
        cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
        
        cell.firstItemModel = model;

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

        return cell;
        
    }else if (model.bigpic_arr.count == 1){
#pragma mark - 一张图片的cell
        BH_C_OneBigPic_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"oneCell"];
        
        cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
        
        cell.firstItemModel = model;

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

        return cell;
        
    }else if (model.bigpic_arr.count == 2){
#pragma mark - 两张图片的cell
        BH_C_TwoBigPic_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twoCell"];
        
        cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];

        cell.firstItemModel = model;

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

        return cell;
        
    }else{
#pragma mark - 三张图片的cell
        BH_C_ThreeBigPic_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeCell"];
        
        cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];

        cell.firstItemModel = model;

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

        return cell;
        
    }
    
}
#pragma mark - 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BH_C_FirstItem_Model *model = self.arrModel[indexPath.row];
    
    if (model.bigpic_arr.count == 0) {
        return 150 * lfheight;
    }else if (model.bigpic_arr.count == 1){
        return 260 * lfheight;
    }else if (model.bigpic_arr.count == 2){
        return 260 * lfheight;
    }else{
        return 260 * lfheight;
    }
    
}
#pragma mark - cell的动画效果
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, 0, 0, 0, 1 * lfheight);//渐变
    transform = CATransform3DScale(transform, 0, 0, 0);//由小变大
    
    cell.layer.transform = transform;
    cell.layer.opacity = 0;
    
    [UIView animateWithDuration:0.9 animations:^{
        cell.layer.transform = CATransform3DIdentity;
        cell.layer.opacity = 1;
    }];
    
    
}
#pragma mark - 跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    BH_WKWebView_VC *vc = [[BH_WKWebView_VC alloc] init];
        BH_C_FirstItem_Model *model = self.arrModel[indexPath.row];
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
#pragma mark - 上拉刷新
-(void)getUpData{
    [self.arrModel removeLastObject];
    [self.tableView reloadData];
    [self getDataFromJson:1];
}
#pragma mark - 下拉加载
-(void)getDownData{
    _pNumber++;
    [self getDataFromJson:_pNumber];
}

#pragma mark - 热议数据解析
-(void)getDataFromJson:(NSInteger)page{
    NSString *str = [NSString stringWithFormat:@"http://open.qyer.com/qyer/community/hotbbs/index?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=867168024167485&track_app_version=6.9.4&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&lat=38.88353&lon=121.544509&page=%ld&count=10", page];
    [BHNetTool GET:str body:nil headerFile:nil response:BHJSON success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        
        [BHCacheTool archiverObject:dic ByKey:@"firstItemCache"WithPath:@"firstItem.plist"];

        NSMutableArray *dataDic = dic[@"data"];
        for (NSDictionary *dic in dataDic) {
            BH_C_FirstItem_Model *model = [[BH_C_FirstItem_Model alloc] initWithDic:dic];
            [self.arrModel addObject:model];
        }
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"firstItemCache"WithPath:@"firstItem.plist"];

        NSMutableArray *dataDic = dic[@"data"];
        for (NSDictionary *dic in dataDic) {
            BH_C_FirstItem_Model *model = [[BH_C_FirstItem_Model alloc] initWithDic:dic];
            [self.arrModel addObject:model];
        }
        
        [self.tableView reloadData];

        
    }];
}
@end
