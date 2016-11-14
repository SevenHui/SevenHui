
//
//  BH_R_DisCount_FourSection_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/20.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_DisCount_FourSection_TableViewCell.h"
#import "BH_R_DisCount_FourSection_CollectionViewCell.h"
#import "BH_R_Discount_Model.h"
#import "BH_WKWebView_VC.h"
#import "BH_D_Section_WU_VC.h"
@interface BH_R_DisCount_FourSection_TableViewCell ()
<UICollectionViewDataSource, UICollectionViewDelegate>

/**<#注释#>*/
@property (nonatomic, retain)UICollectionView *collectionView;

@end

@implementation BH_R_DisCount_FourSection_TableViewCell
-(void)dealloc{
    [_array release];
    [_collectionView release];
    [_arrGoodModel release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.arrGoodModel = [NSMutableArray array];
        self.array = [NSMutableArray array];
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
#pragma mark - 创建布局类
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(190 * lfweight, 200 * lfheight);
    flowLayout.sectionInset = UIEdgeInsetsMake(10 * lfweight, 10 * lfheight, 10 * lfweight, 10 * lfheight);
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
#pragma mark - 创建CollectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, 650 * lfheight) collectionViewLayout:flowLayout];
    [flowLayout release];
    self.collectionView.backgroundColor = [UIColor whiteColor];
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
    [self.collectionView registerClass:[BH_R_DisCount_FourSection_CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrGoodModel.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BH_R_DisCount_FourSection_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
//    cell.backgroundColor = COLOR;
    
    BH_R_Discount_Model *model = self.arrGoodModel[indexPath.item];
    

    [cell jxl_setDayMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    
    [cell.imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:[UIImage imageNamed:@"占位图"]];
    cell.labelTitle.text = model.title;
    cell.labelNum.text = model.status;
    
    NSString *str = [NSString stringWithFormat:@"%@元起", model.price];
    NSString *keyOne = [NSString stringWithFormat:@"%@", model.price];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange rangeOne = [str rangeOfString:keyOne];
    NSDictionary *dic =@{NSFontAttributeName:[UIFont boldSystemFontOfSize:24],NSForegroundColorAttributeName:[UIColor redColor]};
    [attributedString setAttributes:dic range:rangeOne];
    cell.labelPrice.attributedText = attributedString;

    return cell;
    
}
#pragma mark - 跳转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BH_D_Section_WU_VC *vc = [[BH_D_Section_WU_VC alloc] init];
    
//    wkWebViewVC.strURL = self.array[indexPath.item];
    
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

@end
