//
//  BH_D_Section_Details_FirstDetails_CollectionViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/26.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_D_Section_Details_FirstSection_Model;

@interface BH_D_Section_Details_FirstDetails_CollectionViewCell : UICollectionViewCell
/**<#注释#>*/
@property (nonatomic, retain)BH_D_Section_Details_FirstSection_Model *model;

/**背景view*/
@property (nonatomic, retain)UIView *bigView;
/**图片*/
@property (nonatomic, retain)UIImageView *imageViewPhoto;
/**中文名*/
@property (nonatomic, retain)UILabel *labelCnname;
/**英文名*/
@property (nonatomic, retain)UILabel *labelEnname;
/**去过人数*/
@property (nonatomic, retain)UILabel *labelNum;
/**代表景点*/
@property (nonatomic, retain)UILabel *labelDeputy;

@end
