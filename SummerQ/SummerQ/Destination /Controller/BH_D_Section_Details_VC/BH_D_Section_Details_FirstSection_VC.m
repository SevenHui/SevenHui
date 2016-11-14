//
//  BH_D_Section_Details_FirstSection_VC.m
//  SummerQ
//
//  Created by apple on 16/7/26.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  热门城市

#import "BH_D_Section_Details_FirstSection_VC.h"
#import "BHNetTool.h"
#import "BH_D_Section_Details_FirstDetails_CollectionViewCell.h"
#import "BH_D_Section_Details_FirstSection_Model.h"
#import "BH_D_Section_Details_FirstSec_Details_VC.h"
@interface BH_D_Section_Details_FirstSection_VC ()
<UICollectionViewDataSource, UICollectionViewDelegate>
/**<#注释#>*/
@property (nonatomic, retain)UICollectionView *collectionView;
/**热门城市数据数组*/
@property (nonatomic, retain)NSMutableArray *arrModel;

@end

@implementation BH_D_Section_Details_FirstSection_VC
-(void)dealloc{
    self.collectionView.delegate = nil;
    self.collectionView.dataSource = nil;
    [_arrModel release];
    [_collectionView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    [self getDataFromJson];
    [self creatCollectionView];

}
-(void)config{
    self.view.backgroundColor = [UIColor whiteColor];
    // 热门城市数据数组
    self.arrModel = [NSMutableArray array];
    
#pragma 自定义导航返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回键"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
}
#pragma mark - 返回按钮
- (void)leftAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)creatCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(180 * lfweight, 250 * lfheight);
    flowLayout.sectionInset = UIEdgeInsetsMake(20 * lfheight, 20 * lfweight, 20 * lfheight, 20 * lfweight);
    flowLayout.minimumInteritemSpacing = 10 * lfheight;
    flowLayout.minimumLineSpacing = 10 * lfweight;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, (1200 - 64 - 50) * lfheight) collectionViewLayout:flowLayout];
    [flowLayout release];
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    [self.collectionView release];

    [self.collectionView jxl_setDayMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

    [self.collectionView registerClass:[BH_D_Section_Details_FirstDetails_CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrModel.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BH_D_Section_Details_FirstDetails_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = COLOR;
    cell.model = self.arrModel[indexPath.item];

    [cell jxl_setDayMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    return cell;
}
#pragma mark - 热门城市数据解析
-(void)getDataFromJson{
    [_arrModel removeAllObjects];
    [BHNetTool GET:@"http://open.qyer.com/place/city/get_city_list?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_user_id=8145726&track_deviceid=867168024167485&track_app_version=6.9.5&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&lat=38.883472&lon=121.544473&page=1&countryid=11" body:nil headerFile:nil response:BHJSON success:^(id result) {
        NSDictionary *dic = (NSDictionary *)result;
        
        [BHCacheTool archiverObject:dic ByKey:@"hotCityCache"WithPath:@"hotcity.plist"];

        NSMutableArray *arrData = dic[@"data"];
        for (NSDictionary *dic in arrData) {
            BH_D_Section_Details_FirstSection_Model *model = [[BH_D_Section_Details_FirstSection_Model alloc] initWithDic:dic];
            [self.arrModel addObject:model];
        }
        
        [self.collectionView reloadData];
        
    } failure:^(NSError *error) {
        
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"hotcityCache"WithPath:@"hotcity.plist"];
        
        NSMutableArray *arrData = dic[@"data"];
        for (NSDictionary *dic in arrData) {
            BH_D_Section_Details_FirstSection_Model *model = [[BH_D_Section_Details_FirstSection_Model alloc] initWithDic:dic];
            [self.arrModel addObject:model];
        }
        
        [self.collectionView reloadData];

        
    }];
}

@end
