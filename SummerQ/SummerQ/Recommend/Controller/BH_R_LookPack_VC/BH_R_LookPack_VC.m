
//
//  BH_R_LookPack_VC.m
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  看锦囊 

#import "BH_R_LookPack_VC.h"
#import "BH_R_HeaderView.h"
#import "BHNetTool.h"
#import "BH_R_LookPack_CollectionViewCell.h"
#import "BH_R_LookPackGuides_Model.h"
#import "BH_R_LookPack_Model.h"
@interface BH_R_LookPack_VC ()
<
UITableViewDataSource,
UITableViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegate
>
/**UITableView*/
@property (nonatomic, retain)UITableView *tableView;
/**TableView数据数组*/
@property (nonatomic, retain)NSMutableArray *arrCnnameModel;

/**UICollectionView*/
@property (nonatomic, retain)UICollectionView *collectionView;
/**CollectionView数据数组*/
@property (nonatomic, retain)NSMutableArray *arrGuidesModel;
/**url数据字符串*/
@property (nonatomic, retain)NSString *string;

@end

@implementation BH_R_LookPack_VC
-(void)dealloc{
    self.collectionView.delegate = nil;
    self.collectionView.dataSource = nil;
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
    [_string release];
    [_arrCnnameModel release];
    [_collectionView release];
    [_arrCnnameModel release];
    [_tableView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self config];
    [self getDataFromJsonTableView];
    [self getDataFromJsonCollectionView:999999];
    [self creatTableView];
    [self creatCollectionView];
    
}
-(void)config{
    self.view.backgroundColor = [UIColor whiteColor];
    // TableView数据数组
    self.arrCnnameModel = [NSMutableArray array];
    // CollectionView数据数组
    self.arrGuidesModel = [NSMutableArray array];
#pragma 自定义导航返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回键"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
}
#pragma mark - 返回按钮
- (void)leftAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];

}
#pragma mark - UITableView
-(void)creatTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH * 0.25, HEIGHT - 64 - 49) style:0];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self.tableView release];
    [self.tableView setSeparatorColor:[UIColor clearColor]];

    [self.tableView jxl_setDayMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrCnnameModel.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    BH_R_LookPack_Model *model = [self.arrCnnameModel objectAtIndex:indexPath.row];
    
    cell.textLabel.text = model.cnname;
    cell.textLabel.textAlignment = 1;
    
    [cell jxl_setDayMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BH_R_LookPack_Model *model = [self.arrCnnameModel objectAtIndex:indexPath.row];
//    NSLog(@"%ld",[model.idd integerValue]);
    [self getDataFromJsonCollectionView:[model.idd integerValue]];
    
}


#pragma mark - TableView 数据解析
-(void)getDataFromJsonTableView{
    [_arrCnnameModel removeAllObjects];
    [BHNetTool POST:@"http://open.qyer.com/qyer/guide/category_list" body:@"client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=867168024167485&track_app_version=6.9.4&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&lat=38.883539&lon=121.544513" bodyStyle:BHBodyString headerFile:nil response:BHJSON success:^(id result) {
        NSDictionary *dic = (NSDictionary *)result;
        [BHCacheTool archiverObject:dic ByKey:@"cnnameCache"WithPath:@"cnname.plist"];
        NSArray *arrData = dic[@"data"];
        for (NSDictionary *dic in arrData) {
            BH_R_LookPack_Model *model = [[BH_R_LookPack_Model alloc] initWithDic:dic];
            [self.arrCnnameModel addObject:model];
            
        }

        [self.tableView reloadData];

        
    } failure:^(NSError *error) {
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"cnnameCache"WithPath:@"cnname.plist"];
        NSArray *arrData = dic[@"data"];
        for (NSDictionary *dic in arrData) {
            BH_R_LookPack_Model *model = [[BH_R_LookPack_Model alloc] initWithDic:dic];
            [self.arrCnnameModel addObject:model];
            
        }
        
        [self.tableView reloadData];

        
        
    }];
}

#pragma mark - UICollectionView
-(void)creatCollectionView{
// 创建布局类
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(120 * lfweight, 180 * lfheight);
    flowLayout.sectionInset = UIEdgeInsetsMake(20 * lfweight, 20 * lfheight, 20 * lfweight, 20 * lfheight);
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.minimumLineSpacing = 20;
// CollectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(WIDTH * 0.25, 0, WIDTH - (WIDTH * 0.25), HEIGHT - 64 - 49) collectionViewLayout:flowLayout];
    [flowLayout release];
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    [self.collectionView release];

    [self.collectionView jxl_setDayMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

#pragma mark - 注册CollectionView的重用池
    [self.collectionView registerClass:[BH_R_LookPack_CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrGuidesModel.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BH_R_LookPack_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.lookPackGuidesModel = self.arrGuidesModel[indexPath.item];
    cell.backgroundColor = COLOR;

    [cell jxl_setDayMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BH_R_LookPackGuides_Model *model = [self.arrGuidesModel objectAtIndex:indexPath.item];
    
    [self getDataFromJsonWebView:model.guide_id];

}
#pragma mark - collectionView 数据解析
-(void)getDataFromJsonCollectionView:(NSInteger)urlid{
    [self.arrGuidesModel removeAllObjects];
    NSString *strID = [NSString stringWithFormat:@"http://open.qyer.com/qyer/guide/channel_list?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_user_id=8145726&track_deviceid=867168024167485&track_app_version=6.9.5&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&lat=38.883521&lon=121.544496&id=%ld",urlid];
    
    [BHNetTool GET:strID body:nil headerFile:nil response:BHJSON success:^(id result) {
        NSDictionary *dic = (NSDictionary *)result;
        [BHCacheTool archiverObject:dic ByKey:@"guidesCache"WithPath:@"guides.plist"];
        NSArray *arrData = [dic objectForKey:@"data"];
        for (NSDictionary *dic in arrData) {
            NSMutableArray *arr = [dic objectForKey:@"guides"];
            for (NSDictionary *dict in arr) {
                BH_R_LookPackGuides_Model *model = [[BH_R_LookPackGuides_Model alloc] initWithDic:dict];
                [self.arrGuidesModel addObject:model];
            }
        
        }[self.collectionView reloadData];
        
    } failure:^(NSError *error) {
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"guidesCache"WithPath:@"guides.plist"];
        NSArray *arrData = [dic objectForKey:@"data"];
        for (NSDictionary *dic in arrData) {
            NSMutableArray *arr = [dic objectForKey:@"guides"];
            for (NSDictionary *dict in arr) {
                BH_R_LookPackGuides_Model *model = [[BH_R_LookPackGuides_Model alloc] initWithDic:dict];
                [self.arrGuidesModel addObject:model];
            }
            
        }[self.collectionView reloadData];

        
    }];
}

#pragma mark - webView数据解析
-(void)getDataFromJsonWebView:(NSString *)idd{
    NSString *str = [NSString stringWithFormat: @"http://open.qyer.com/qyer/guide/detail?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_user_id=8145726&track_deviceid=867168024167485&track_app_version=6.9.5&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1469634901498&lat=38.883477&lon=121.544476&id=%@", idd];
    [BHNetTool GET:str body:nil headerFile:nil response:BHJSON success:^(id result) {
        NSDictionary *dic = (NSDictionary *)result;
        [BHCacheTool archiverObject:dic ByKey:@"clientCache"WithPath:@"client.plist"];
        NSDictionary *dicData = dic[@"data"];
        self.string = [dicData objectForKey:@"link"];
        
        BH_WKWebView_VC *vc = [[BH_WKWebView_VC alloc] init];
        vc.strURL = _string;
        [self.navigationController pushViewController:vc animated:YES];


    } failure:^(NSError *error) {
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"clientCache"WithPath:@"client.plist"];
        NSDictionary *dicData = dic[@"data"];
        self.string = [dicData objectForKey:@"link"];

        
    }];
}

@end
