//
//  BH_Community_VC.m
//  SummerQ
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 沐沐`柒. All rights reserved.

//  Community 社区

#import "BH_Community_VC.h"
#import "BH_C_Navigation_CollectionViewCell.h"
#import "BH_C_FirstItem_CollectionViewCell.h"
#import "BH_C_SecondItem_CollectionViewCell.h"
#import "BH_C_ThirdItem_CollectionViewCell.h"
@interface BH_Community_VC ()
<UICollectionViewDataSource,UICollectionViewDelegate>

/**导航栏CollectionView*/
@property (nonatomic, retain)UICollectionView *naviCollectionView;
/**跳转界面CollectionView*/
@property (nonatomic, retain)UICollectionView *changeCollectionView;
/**导航栏数组*/
@property (nonatomic, retain)NSArray *arrNavi;
/**<#注释#>*/
@property (nonatomic, assign)NSInteger naviIndexPath;

@end

@implementation BH_Community_VC
-(void)dealloc{
    self.changeCollectionView.delegate = nil;
    self.changeCollectionView.dataSource = nil;
    self.naviCollectionView.delegate = nil;
    self.naviCollectionView.dataSource = nil;
    [_arrNavi release];
    [_changeCollectionView release];
    [_naviCollectionView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self config];
    [self creatNavigationCollectionView];
    [self creatChangeCollectionView];
    
    
}
-(void)config{
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.35 green:0.71 blue:0.54 alpha:1.00];

    self.view.backgroundColor = [UIColor whiteColor];
    // 导航栏数组
    self.arrNavi = @[@"热议", @"版面", @"寻旅伴"];
    
}
#pragma mark - 导航栏 CollectionView
-(void)creatNavigationCollectionView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(70 * lfweight, 30 * lfheight);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 30;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.naviCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 300 * lfweight, 30 * lfheight) collectionViewLayout:flowLayout];
    [flowLayout release];
    self.naviCollectionView.backgroundColor =[UIColor clearColor];
    self.naviCollectionView.dataSource = self;
    self.naviCollectionView.delegate = self;
    self.navigationItem.titleView = _naviCollectionView;
    [self.naviCollectionView release];
    
    [self.naviCollectionView registerClass:[BH_C_Navigation_CollectionViewCell class] forCellWithReuseIdentifier:@"navigationCell"];
    
}
#pragma mark - item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (collectionView == self.naviCollectionView) {
        return self.arrNavi.count;
    }
    return self.arrNavi.count;
    
}
#pragma mark - cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
#pragma mark - 导航
    if (collectionView == self.naviCollectionView) {
        
        BH_C_Navigation_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"navigationCell" forIndexPath:indexPath];
        
//        cell.backgroundColor = [UIColor magentaColor];
        
        cell.naviStr = self.arrNavi[indexPath.row];
        
        return cell;
    }
    if (indexPath.item == 0) {
#pragma mark - 热议
        BH_C_FirstItem_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"firstItemCell" forIndexPath:indexPath];
        
//        cell.backgroundColor = [UIColor redColor];
        
        cell.string = self.arrNavi[indexPath.row];

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

        
        return cell;
        
    }else if (indexPath.item == 1){
#pragma mark - 进入版面
        BH_C_SecondItem_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"secondItemCell" forIndexPath:indexPath];
        
//        cell.backgroundColor = [UIColor orangeColor];

        [cell jxl_setDayMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor whiteColor];
        } nightMode:^(UIView *view) {
            //改变
            cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
        }];

        
        return cell;
        
    }else{
#pragma mark - 寻旅伴
        BH_C_ThirdItem_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"thirdItemCell" forIndexPath:indexPath];
        
//        cell.backgroundColor = [UIColor yellowColor];

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
#pragma mark - 切换界面 CollectionView
-(void)creatChangeCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(WIDTH, HEIGHT - 49 * lfheight);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.changeCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) collectionViewLayout:flowLayout];
    [flowLayout release];
    self.changeCollectionView.backgroundColor = [UIColor whiteColor];
    self.changeCollectionView.dataSource = self;
    self.changeCollectionView.delegate = self;
    [self.changeCollectionView release];

    [self.changeCollectionView jxl_setDayMode:^(UIView *view) {
        //改变
        self.changeCollectionView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.changeCollectionView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

    [self.changeCollectionView registerClass:[BH_C_FirstItem_CollectionViewCell class] forCellWithReuseIdentifier:@"firstItemCell"];
    
    [self.changeCollectionView registerClass:[BH_C_SecondItem_CollectionViewCell class] forCellWithReuseIdentifier:@"secondItemCell"];
    
    [self.changeCollectionView registerClass:[BH_C_ThirdItem_CollectionViewCell class] forCellWithReuseIdentifier:@"thirdItemCell"];
    
    self.changeCollectionView.pagingEnabled = YES;
    [self.view addSubview:_changeCollectionView];
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView == self.naviCollectionView) {
        self.naviIndexPath = indexPath.row;
        // 偏移量
        self.changeCollectionView.contentOffset = CGPointMake(self.view.bounds.size.width * self.naviIndexPath, 0);
        
    }

}


@end
