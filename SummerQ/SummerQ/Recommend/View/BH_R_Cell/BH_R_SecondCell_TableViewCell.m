//
//  BH_R_SecondCell_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/14.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_SecondCell_TableViewCell.h"
#import "UIImageView+WebCache.h"
#import "BH_R_SecondCell_CollectionViewCell.h"
#import "BH_R_Discount_VC.h"
#import "BH_WKWebView_VC.h"
#import "BH_R_Second_Detail_Model.h"
@interface BH_R_SecondCell_TableViewCell ()
<UICollectionViewDataSource, UICollectionViewDelegate>

/**UICollectionView*/
@property (nonatomic, retain)UICollectionView *collectionView;
/**头视图imageView*/
@property (nonatomic, retain)UIImageView *imageViewPhoto;
/**尾视图btn*/
@property (nonatomic, retain)UIButton *btn;
/**<#注释#>*/
@property (nonatomic, retain)NSString *string;
/**<#注释#>*/
@property (nonatomic, retain)NSMutableArray *array;

@end

@implementation BH_R_SecondCell_TableViewCell
-(void)dealloc{
    self.collectionView.delegate = nil;
    self.collectionView.delegate = nil;
    [_model release];
    [_string release];
    [_arrDiscount_subject release];
    [_modelArray release];
    [_btn release];
    [_imageViewPhoto release];
    [_collectionView release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        [self getDataFromJson];
        // 第二分区数组
        self.modelArray = [NSMutableArray array];
        self.string = [NSString string];
        self.array = [NSMutableArray array];
        
     
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
#pragma mark - 创建布局类
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(190 * lfweight, 190 * lfheight);
    flowLayout.sectionInset = UIEdgeInsetsMake(10 * lfweight, 10 * lfheight, 10 * lfweight, 10 * lfheight);
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
    // 尾视图大小
    flowLayout.footerReferenceSize = CGSizeMake(0, 50 * lfheight);
#pragma mark - 创建CollectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, 460 * lfheight) collectionViewLayout:flowLayout];
    // 关闭collectionView滚动功能
    self.collectionView.scrollEnabled = NO;
    [flowLayout release];
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self addSubview:_collectionView];
    [self.collectionView release];
    
    [self.collectionView jxl_setDayMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

    
#pragma mark - 注册CollectionView的重用池
    [self.collectionView registerClass:[BH_R_SecondCell_CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
#pragma mark - 注册尾视图的重用池
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];

    
}
#pragma mark - UIcollectionViewDataSource的协议方法
#pragma mark - Item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.modelArray.count;
    
}
#pragma mark - cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BH_R_SecondCell_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.secondCell_Model = [self.modelArray objectAtIndex:indexPath.item];
    
    [cell jxl_setDayMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    
    return cell;
    
}
#pragma mark - 尾视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
    
    footerView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    [footerView jxl_setDayMode:^(UIView *view) {
        //改变
        footerView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        footerView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

    
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = CGRectMake(0, 0, footerView.frame.size.width, footerView.frame.size.height * 0.95);
    [self.btn setTitle:@"显示全部" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [footerView addSubview:_btn];
    
    [self.btn jxl_setDayMode:^(UIView *view) {
        //改变
        self.btn.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.btn.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    
    [self.btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return footerView;
    
    

}
-(void)btnAction:(UIButton *)btn{
    
    BH_R_Discount_VC *disountVC = [[BH_R_Discount_VC alloc] init];
    self.block(disountVC);

}
-(void)setArrDiscount_subject:(NSMutableArray *)arrDiscount_subject{
    if (_arrDiscount_subject != arrDiscount_subject) {
        [_arrDiscount_subject release];
        _arrDiscount_subject = [arrDiscount_subject retain];
        
    }
    [self.imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:[arrDiscount_subject objectAtIndex:0]] placeholderImage:[UIImage imageNamed:@"占位图"]];
    
    [self.collectionView reloadData];
    
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
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    BH_WKWebView_VC *vc = [[BH_WKWebView_VC alloc] init];
//    
////    BH_R_Second_Detail_Model *model = [self.array objectAtIndex:indexPath.row];
//    vc.strURL = self.array[0];
//    [[self naviController] pushViewController:vc animated:YES];
//
//    
//}
-(void)getDataFromJson{
    [self.array removeAllObjects];
    NSString *str = [NSString stringWithFormat:@"http://open.qyer.com/lastminute/get_detail?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=867168024167485&track_app_version=7.0.0.1&track_app_channel=oppo&track_device_info=R7c&track_os=Android4.4.4&app_installtime=1470745210582&lat=38.883544&lon=121.544492&id=%ld", self.model.id];
    [BHNetTool GET:str body:nil headerFile:nil response:BHJSON success:^(id result) {
        NSDictionary *dic = (NSDictionary *)result;
        NSDictionary *dicData = [dic objectForKey:@"data"];
        [self.array addObject:[dicData objectForKey:@"app_url"]];
        
//        self.string = [dicData objectForKey:@"app_url"];
        
        
        [self.collectionView reloadData];
        
    } failure:^(NSError *error) {
        
        
    }];
    
}

@end
