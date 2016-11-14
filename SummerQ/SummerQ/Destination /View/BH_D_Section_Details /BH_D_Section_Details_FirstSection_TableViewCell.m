//
//  BH_D_Section_Details_FirstSection_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/23.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_Section_Details_FirstSection_TableViewCell.h"
#import "BH_D_Section_Details_FirstSection_CollectionViewCell.h"
#import "BH_D_Section_Details_HotCity_Model.h"
#import "BH_D_Section_Details_FirstSec_Details_VC.h"
@interface BH_D_Section_Details_FirstSection_TableViewCell ()
<UICollectionViewDataSource, UICollectionViewDelegate>
/**<#注释#>*/
@property (nonatomic, retain)UICollectionView *collectionView;

@end

@implementation BH_D_Section_Details_FirstSection_TableViewCell
-(void)dealloc{
    self.collectionView.delegate = nil;
    self.collectionView.dataSource = nil;
    [_array_Hot release];
    [_collectionView release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        self.array_Hot = [NSMutableArray array];
     }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
#pragma mark - 创建布局类
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(190 * lfweight, 100 * lfheight);
    flowLayout.sectionInset = UIEdgeInsetsMake(10 * lfweight, 10 * lfheight, 10 * lfweight, 10 * lfheight);
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
#pragma mark - 创建CollectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, 230 * lfheight) collectionViewLayout:flowLayout];
    [flowLayout release];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self addSubview:_collectionView];
    [self.collectionView release];
    // 关闭滚动功能
    self.collectionView.scrollEnabled = NO;

    [self.collectionView jxl_setDayMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

#pragma mark - 注册CollectionView的重用池
    [self.collectionView registerClass:[BH_D_Section_Details_FirstSection_CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array_Hot.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BH_D_Section_Details_FirstSection_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    BH_D_Section_Details_HotCity_Model *model = self.array_Hot[indexPath.item];

    [cell jxl_setDayMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    [cell.imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:[UIImage imageNamed:@"占位图"]];
    cell.labelCnname.text = model.cnname;
    cell.labelEnname.text = model.enname;
    
    return cell;

}
#pragma mark - 跳转界面
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BH_D_Section_Details_FirstSec_Details_VC *VC = [[BH_D_Section_Details_FirstSec_Details_VC alloc]init];
    BH_D_Section_Details_HotCity_Model *model = self.array_Hot[indexPath.row];
//    VC.ID = model.id;
    VC.model = model;
    
    [[self naviController] pushViewController:VC animated:YES];
    
}

//当前控制器的导航控制器
- (UINavigationController*)naviController {
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            
            return (UINavigationController*)nextResponder;
        }
    }
    return nil;
}
-(void)setArray_Hot:(NSMutableArray *)array_Hot{
    if (_array_Hot != array_Hot) {
        [_array_Hot release];
        _array_Hot = [array_Hot retain];
    }
    
    [self.collectionView reloadData];
    
}
@end
