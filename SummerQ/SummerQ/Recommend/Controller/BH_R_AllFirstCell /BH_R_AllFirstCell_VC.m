//
//  BH_R_AllFirstCell_VC.m
//  SummerQ
//
//  Created by apple on 16/7/20.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  发现下一站 查看全部

#import "BH_R_AllFirstCell_VC.h"
#import "BHNetTool.h"
#import "BH_R_AllFirstCell_CollectionViewCell.h"
#import "BH_R_AllFirstCell_Model.h"
#import "BH_WKWebView_VC.h"
@interface BH_R_AllFirstCell_VC ()
<UICollectionViewDataSource, UICollectionViewDelegate>
/**<#注释#>*/
@property (nonatomic, retain)UICollectionView *collectionView;
/**数据数组*/
@property (nonatomic, retain)NSMutableArray *arrModel;
/**<#注释#>*/
@property (nonatomic, assign)NSInteger pNumber;

@end

@implementation BH_R_AllFirstCell_VC
-(void)dealloc{
    self.collectionView.delegate = nil;
    self.collectionView.dataSource = nil;
    [_collectionView release];
    [_arrModel release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    [self getDataFromJson:1];
    [self creatCollectionView];
    
}
-(void)config{
    
    self.pNumber = 1;
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 数据数组
    self.arrModel = [NSMutableArray array];
#pragma 自定义导航返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回键"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
}
#pragma mark - 返回按钮
- (void)leftAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)creatCollectionView{
#pragma mark - 创建布局类
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(WIDTH - 40 * lfweight, 250 * lfheight);
    flowLayout.sectionInset = UIEdgeInsetsMake(20 * lfweight, 20 * lfheight, 20 * lfweight, 20 * lfheight);
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.minimumLineSpacing = 20;
#pragma mark - 创建CollectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, HEIGHTSCREEN) collectionViewLayout:flowLayout];
    [flowLayout release];
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    [self.collectionView release];

    [self.collectionView jxl_setDayMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

    //上拉加载
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getUpData];
        [self.collectionView.mj_header endRefreshing];
    }];
    //下拉刷新
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self getDownData];
        [self.collectionView.mj_footer endRefreshing];
    }];

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
    BH_WKWebView_VC *webViewVC = [[BH_WKWebView_VC alloc] init];
    BH_R_AllFirstCell_Model *model = [self.arrModel objectAtIndex:indexPath.item];
    webViewVC.strURL = model.url;
    [self.navigationController pushViewController:webViewVC animated:YES];
    
}
#pragma mark -- 下拉刷新
- (void)getUpData{
    [self.arrModel removeAllObjects];
    [self.collectionView reloadData];
    [self getDataFromJson:1];
}
#pragma mark -- 上拉加载
- (void)getDownData{
    _pNumber++;
    [self getDataFromJson:_pNumber];
}

#pragma mark - 发现下一站 显示全部数据解析
-(void)getDataFromJson:(NSInteger)page{
//    [_arrModel removeAllObjects];
    NSString *str = [NSString stringWithFormat:@"http://open.qyer.com/qyer/special/topic/special_list?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_user_id=8145726&track_deviceid=867168024167485&track_app_version=6.9.5&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1468288096877&lat=38.883521&lon=121.544496&oauth_token=0196cd1c0c5bfebb5838b37c2310e594&page=%ld&count=10", page];
    [BHNetTool GET:str body:nil headerFile:nil response:BHJSON success:^(id result) {
        NSDictionary *dic = (NSDictionary *)result;
        
        [BHCacheTool archiverObject:dic ByKey:@"allCache"WithPath:@"all.plist"];

        NSMutableArray *array = dic[@"data"];
        for (NSDictionary *dict in array) {
            BH_R_AllFirstCell_Model *model = [[BH_R_AllFirstCell_Model alloc] initWithDic:dict];
            [self.arrModel addObject:model];
//            NSLog(@"%@",self.arrModel);
            }
        
        [self.collectionView reloadData];
        
    } failure:^(NSError *error) {
        
        NSDictionary *dic = [BHCacheTool unarchiverObjectByKey:@"allCache"WithPath:@"all.plist"];

        NSMutableArray *array = dic[@"data"];
        for (NSDictionary *dict in array) {
            BH_R_AllFirstCell_Model *model = [[BH_R_AllFirstCell_Model alloc] initWithDic:dict];
            [self.arrModel addObject:model];
            
        }
        
        [self.collectionView reloadData];

        
    }];
}

@end
