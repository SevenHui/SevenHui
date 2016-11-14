//
//  BH_R_HeaderView.m
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  头视图

#import "BH_R_HeaderView.h"
#import "BH_R_HeaderView_CollectionViewCell.h"
#import "AppDelegate.h"
#import "BH_R_LookPack_VC.h"
#import "BH_R_Discount_VC.h"
@interface BH_R_HeaderView ()
<UICollectionViewDataSource, UICollectionViewDelegate>

/**UICollectionView*/
@property (nonatomic, retain)UICollectionView *collectionView;
/**传值数组*/
@property (nonatomic, retain)NSArray *arrText;

@end

@implementation BH_R_HeaderView
-(void)dealloc{
    self.collectionView.dataSource = nil;
    self.collectionView.delegate = nil;
    [_arrText release];
    [_collectionView release];
    [super dealloc];
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(200 * lfweight, 90 * lfheight);
    flowLayout.sectionInset = UIEdgeInsetsMake(10 * lfweight, 0, 0, 0);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, 100 * lfheight) collectionViewLayout:flowLayout];
    [flowLayout release];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self addSubview:_collectionView];
    [self.collectionView release];

    [self.collectionView jxl_setDayMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    [self.collectionView registerClass:[BH_R_HeaderView_CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BH_R_HeaderView_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    switch (indexPath.item) {
        case 0:
            cell.imagePhoto.image = [UIImage imageNamed:@"锦囊"];
            cell.labelName.text = @"看锦囊";
            
            break;
        case 1:
            cell.imagePhoto.image = [UIImage imageNamed:@"折扣"];
            cell.labelName.text = @"抢折扣";
            break;
        default:
            break;
    }
    
    return cell;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UITabBarController *root = [UIApplication sharedApplication].delegate.window.rootViewController;
    
    if (indexPath.item == 0) {
        BH_R_LookPack_VC *packVC = [[BH_R_LookPack_VC alloc]init];
        [root.selectedViewController pushViewController:packVC animated:YES];
        
    }else if (indexPath.item == 1){
        BH_R_Discount_VC *disVC = [[BH_R_Discount_VC alloc] init];
        [root.selectedViewController pushViewController:disVC animated:YES];

    }
    
    
}


@end
