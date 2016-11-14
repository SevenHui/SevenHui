//
//  BH_C_SecoundItem_Details_VC.m
//  SummerQ
//
//  Created by apple on 16/7/28.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_C_SecoundItem_Details_VC.h"
#import "BH_C_SecoundItem_Details_Model.h"
#import "BH_C_SecoundItem_Details_TableViewCell.h"
@interface BH_C_SecoundItem_Details_VC ()
<UITableViewDataSource ,UITableViewDelegate>
/**<#注释#>*/
@property (nonatomic, retain)UITableView *tableView;
/**<#注释#>*/
@property (nonatomic, retain)NSMutableArray *arrModel;

@end

@implementation BH_C_SecoundItem_Details_VC
-(void)dealloc{
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
    [_arrModel release];
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

    self.arrModel = [NSMutableArray array];
    
}
-(void)creatTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, HEIGHTSCREEN) style:0];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:_tableView];
    [self.tableView release];
    
    [self.tableView registerClass:[BH_C_SecoundItem_Details_TableViewCell class] forCellReuseIdentifier:@"cell"];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrModel.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BH_C_SecoundItem_Details_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    cell.backgroundColor = COLOR;
    cell.model = [self.arrModel objectAtIndex:indexPath.row];
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220;
    
}
#pragma mark - WebView
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BH_WKWebView_VC *vc = [[BH_WKWebView_VC alloc] init];
    BH_C_SecoundItem_Details_Model *model = [self.arrModel objectAtIndex:indexPath.row];
    vc.strURL = model.view_url;
    [vc release];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)getDataFromJson{
    NSString *str = @"http://open.qyer.com/qyer/bbs/forum_thread_list?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_user_id=8145726&track_deviceid=867168024167485&track_app_version=6.9.5&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&lat=38.87698&lon=121.544074&forum_id=57&forum_type=1,2,6&count=20&page=1&delcache=0";
    [BHNetTool GET:str body:nil headerFile:nil response:BHJSON success:^(id result) {
        NSDictionary *dic = (NSDictionary *)result;
        
        [BHCacheTool archiverObject:dic ByKey:@"entryCache"WithPath:@"entry.plist"];

        NSDictionary *dicData = dic[@"data"];
        NSMutableArray *arrEntry = dicData[@"entry"];
        for (NSDictionary *dic in arrEntry) {
            BH_C_SecoundItem_Details_Model *model = [[BH_C_SecoundItem_Details_Model alloc] initWithDic:dic];
            [self.arrModel addObject:model];
            
        }
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"entryCache"WithPath:@"entry.plist"];

        NSDictionary *dicData = dic[@"data"];
        NSMutableArray *arrEntry = dicData[@"entry"];
        for (NSDictionary *dic in arrEntry) {
            BH_C_SecoundItem_Details_Model *model = [[BH_C_SecoundItem_Details_Model alloc] initWithDic:dic];
            [self.arrModel addObject:model];
            
        }
        [self.tableView reloadData];

        
    }];
    
}


@end
