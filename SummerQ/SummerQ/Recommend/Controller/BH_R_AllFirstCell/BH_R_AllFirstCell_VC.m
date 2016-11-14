//
//  BH_R_AllFirstCell_VC.m
//  SummerQ
//
//  Created by apple on 16/7/20.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  发现下一站 显示全部

#import "BH_R_AllFirstCell_VC.h"
#import "BHNetTool.h"
#import "BH_R_AllFirstCell_CollectionViewCell.h"
#import "BH_R_AllFirstCell_Model.h"
#import "BH_R_AllFirstCell_WebView_VC.h"
@interface BH_R_AllFirstCell_VC ()
<UICollectionViewDataSource, UICollectionViewDelegate>
/**<#注释#>*/
@property (nonatomic, retain)UICollectionView *collectionView;
/**数据数组*/
@property (nonatomic, retain)NSMutableArray *arrModel;

@end

@implementation BH_R_AllFirstCell_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    [self getDataFromJson];
    [self creatCollectionView];
    
}
-(void)config{
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 数据数组
    self.arrModel = [NSMutableArray array];
    
    
}
-(void)creatCollectionView{
#pragma mark - 创建布局类
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(WIDTH - 40, 270);
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.minimumLineSpacing = 20;
#pragma mark - 创建CollectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, HEIGHTSCREEN) collectionViewLayout:flowLayout];
    [flowLayout release];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    [self.collectionView release];
#pragma mark - 注册CollectionView的重用池
    [self.collectionView registerClass:[BH_R_AllFirstCell_CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrModel.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BH_R_AllFirstCell_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = COLOR;
    
    cell.allFirstCellModel = self.arrModel[indexPath.item];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BH_R_AllFirstCell_WebView_VC *webViewVC = [[BH_R_AllFirstCell_WebView_VC alloc] init];
    [self.navigationController pushViewController:webViewVC animated:YES];
    
}
#pragma mark - 发现下一站 显示全部
-(void)getDataFromJson{
    [BHNetTool GET:@"http://open.qyer.com/qyer/special/topic/special_list?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_user_id=8145726&track_deviceid=867168024167485&track_app_version=6.9.5&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&lat=38.883521&lon=121.544496&oauth_token=0196cd1c0c5bfebb5838b37c2310e594&page=1&count=10" body:nil headerFile:nil response:BHJSON success:^(id result) {
        NSDictionary *dic = (NSDictionary *)result;
        NSMutableArray *array = dic[@"data"];
        for (NSDictionary *dict in array) {
            BH_R_AllFirstCell_Model *model = [[BH_R_AllFirstCell_Model alloc] initWithDic:dict];
            [self.arrModel addObject:model];
            
            }
        
        [self.collectionView reloadData];
        
    } failure:^(NSError *error) {
        
        
    }];
}
@end
