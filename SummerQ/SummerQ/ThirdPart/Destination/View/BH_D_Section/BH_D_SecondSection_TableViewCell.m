//
//  BH_D_SecondSection_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_SecondSection_TableViewCell.h"
#import "BH_D_SecondSection_CollectionViewCell.h"
#import "BH_D_Smail_Model.h"
#import "BH_D_Section_Details_VC.h"
@interface BH_D_SecondSection_TableViewCell ()
<UICollectionViewDataSource, UICollectionViewDelegate>

/**UICollectionView*/
@property (nonatomic, retain)UICollectionView *collectionView;

@end

@implementation BH_D_SecondSection_TableViewCell
-(void)dealloc{
    self.collectionView.dataSource = nil;
    self.collectionView.delegate = nil;
    [_arrayQ release];
    [_collectionView release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;

}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(180 * lfweight, 80 * lfheight);
    flowLayout.sectionInset = UIEdgeInsetsMake(20 * lfheight, 20 * lfweight, 20 * lfheight, 20 * lfweight);
    flowLayout.minimumInteritemSpacing = 10 * lfheight;
    flowLayout.minimumLineSpacing = 10 *lfweight;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, 3000 *lfheight) collectionViewLayout:flowLayout];
    [flowLayout release];
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self addSubview:_collectionView];
    [self.collectionView release];

    [self.collectionView jxl_setDayMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

    [self.collectionView registerClass:[BH_D_SecondSection_CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    

}
#pragma mark - item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrayQ.count;
    
}
#pragma mark - cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BH_D_SecondSection_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    BH_D_Smail_Model *model = self.arrayQ[indexPath.item];
    

    [self.collectionView jxl_setDayMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

    
    cell.labelCnname.text = model.cnname;
    cell.labelEnname.text = model.enname;
    
    return cell;
    
}
#pragma mark - 跳转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BH_D_Section_Details_VC *detailsVC = [[BH_D_Section_Details_VC alloc] init];
    
    self.block(detailsVC);

}
#pragma mark - 重写set方法
-(void)setArrayQ:(NSMutableArray *)arrayQ{
    if (_arrayQ != arrayQ) {
        [_arrayQ release];
        _arrayQ = [arrayQ retain];
    }
    
    [self.collectionView reloadData];
    
}




@end
