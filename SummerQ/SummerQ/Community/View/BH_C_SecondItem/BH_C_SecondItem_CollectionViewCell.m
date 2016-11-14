//
//  BH_C_SecondItem_CollectionViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  面板

#import "BH_C_SecondItem_CollectionViewCell.h"
#import "BHNetTool.h"
#import "BH_C_NaviTableView_TableViewCell.h"
#import "BH_C_GroupTableView_TableViewCell.h"
#import "BH_C_SecondItem_Model.h"
#import "BH_C_SecondItem_Group_Model.h"
#import "BH_C_SecoundItem_Details_VC.h"
@interface BH_C_SecondItem_CollectionViewCell ()
<UITableViewDataSource, UITableViewDelegate>

/**NaviTableView*/
@property (nonatomic, retain)UITableView *naviTableView;
/**导航数据数组*/
@property (nonatomic, retain)NSMutableArray *arrNaviModel;
/**GroupTableView*/
@property (nonatomic, retain)UITableView *groupTableView;
/**组数据数组*/
@property (nonatomic, retain)NSMutableArray *arrGroupModel;

@end

@implementation BH_C_SecondItem_CollectionViewCell
-(void)dealloc{
    self.naviTableView.dataSource = nil;
    self.naviTableView.delegate = nil;
    self.groupTableView.dataSource = nil;
    self.groupTableView.delegate = nil;
    [_arrGroupModel release];
    [_arrNaviModel release];
    [_naviTableView release];
    [_groupTableView release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 导航数据数组
        self.arrNaviModel = [NSMutableArray array];
        // 组数据数组
        self.arrGroupModel = [NSMutableArray array];
        // 数据解析
        [self getDataFromJson];
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
#pragma mark - 左边TableView
    self.naviTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN * 0.25, HEIGHTSCREEN) style:0];
    self.naviTableView.dataSource = self;
    self.naviTableView.delegate = self;
    [self addSubview:_naviTableView];
    [self.naviTableView release];
    [self.naviTableView setSeparatorColor:[UIColor clearColor]];
    
    [self.naviTableView jxl_setDayMode:^(UIView *view) {
        //改变
        self.naviTableView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.naviTableView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    [self.naviTableView registerClass:[BH_C_NaviTableView_TableViewCell class] forCellReuseIdentifier:@"naviCell"];
#pragma mark - 右边TableView
    self.groupTableView = [[UITableView alloc] initWithFrame:CGRectMake(WIDTHSCREEN * 0.25, 0, WIDTHSCREEN - (WIDTHSCREEN * 0.25), HEIGHTSCREEN - 64 - 49) style:0];
    self.groupTableView.dataSource = self;
    self.groupTableView.delegate = self;
    [self addSubview:_groupTableView];
    [self.groupTableView release];
    [self.groupTableView setSeparatorColor:[UIColor clearColor]];

    [self.groupTableView jxl_setDayMode:^(UIView *view) {
        //改变
        self.groupTableView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.groupTableView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    [self.groupTableView registerClass:[BH_C_GroupTableView_TableViewCell class] forCellReuseIdentifier:@"groupCell"];
    
}
#pragma mark - row个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.naviTableView) {
        return self.arrNaviModel.count;
    }else{
        return self.arrGroupModel.count;
    }
}
#pragma mark - cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.naviTableView) {
#pragma mark - 左边cell
        BH_C_NaviTableView_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"naviCell"];
        
        cell.selectionStyle = UITableViewCellAccessoryNone;
        cell.naviCellModel = self.arrNaviModel[indexPath.row];

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

        return cell;
        
    }else{
#pragma mark - 右边cell
        BH_C_GroupTableView_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"groupCell"];
        
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.selectionStyle = UITableViewCellAccessoryNone;
        
        cell.groupCellModel = self.arrGroupModel[indexPath.row];

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
    if (tableView == self.naviTableView) {
        return 50 * lfheight;
    }else{
        return 100 * lfheight;
    }
}
#pragma mark - cell的动画效果
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CATransform3D transform = CATransform3DIdentity;
    //渐变
    transform = CATransform3DRotate(transform, 0, 0, 0, 1 * lfheight);
    //由小变大
    transform = CATransform3DScale(transform, 0, 0, 0);
    
    cell.layer.transform = transform;
    cell.layer.opacity = 0;
    
    [UIView animateWithDuration:0.9 animations:^{
        cell.layer.transform = CATransform3DIdentity;
        cell.layer.opacity = 1;
    }];
    
    
}
#pragma mark - 跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.naviTableView) {
        BH_C_SecondItem_Model *model = self.arrNaviModel[indexPath.row];
        self.arrGroupModel = model.arrGroup;
        
        [self.groupTableView reloadData];

    }
    if (tableView == self.groupTableView) {
        
        BH_C_SecoundItem_Details_VC *vc = [[BH_C_SecoundItem_Details_VC alloc] init];
        
        [[self naviController] pushViewController:vc animated:YES];
        
    }
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

#pragma mark - 进入版面数据解析
-(void)getDataFromJson{
    NSString *str = [NSString stringWithFormat:@"http://open.qyer.com/qyer/bbs/entry?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=867168024167485&track_app_version=6.9.4&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&lat=38.883476&lon=121.54447"];
    [BHNetTool GET:str body:nil headerFile:nil response:BHJSON success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        
        [BHCacheTool archiverObject:dic ByKey:@"secoundItemCache"WithPath:@"secoundItem.plist"];

        NSDictionary *dataDic = dic[@"data"];
        NSMutableArray *arrForum_list = dataDic[@"forum_list"];
#pragma mark - 左边的数据
        for (NSDictionary *dic in arrForum_list) {
            BH_C_SecondItem_Model * model = [[BH_C_SecondItem_Model alloc] initWithDic:dic];
            [self.arrNaviModel addObject:model];
            
        }
        [self.naviTableView reloadData];
#pragma mark - 右边的数据
        for (NSDictionary *dic in arrForum_list) {
            NSMutableArray *arrGroup = dic[@"group"];
            for (NSDictionary *dics in arrGroup) {
                BH_C_SecondItem_Group_Model *model = [[BH_C_SecondItem_Group_Model alloc] initWithDic:dics];
                [self.arrGroupModel addObject:model];
            }
        }
        [self.groupTableView reloadData];
    
    } failure:^(NSError *error) {
        
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"secoundItemCache"WithPath:@"secoundItem.plist"];

        NSDictionary *dataDic = dic[@"data"];
        NSMutableArray *arrForum_list = dataDic[@"forum_list"];
#pragma mark - 左边的数据
        for (NSDictionary *dic in arrForum_list) {
            BH_C_SecondItem_Model * model = [[BH_C_SecondItem_Model alloc] initWithDic:dic];
            [self.arrNaviModel addObject:model];
            
        }
        [self.naviTableView reloadData];
#pragma mark - 右边的数据
        for (NSDictionary *dic in arrForum_list) {
            NSMutableArray *arrGroup = dic[@"group"];
            for (NSDictionary *dics in arrGroup) {
                BH_C_SecondItem_Group_Model *model = [[BH_C_SecondItem_Group_Model alloc] initWithDic:dics];
                [self.arrGroupModel addObject:model];
            }
        }
        [self.groupTableView reloadData];

        
    }];
}



@end
