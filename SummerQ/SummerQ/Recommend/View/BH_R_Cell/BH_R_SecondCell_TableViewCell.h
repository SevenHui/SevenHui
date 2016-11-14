//
//  BH_R_SecondCell_TableViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/14.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BH_R_SecondCell_Model.h"
@class BH_R_Discount_VC;

@interface BH_R_SecondCell_TableViewCell : UITableViewCell

@property(nonatomic, copy)void(^block)(BH_R_Discount_VC *);

/**第二分区头视图数组*/
@property (nonatomic, retain)NSMutableArray *arrDiscount_subject;
/**第二分区数组*/
@property (nonatomic, retain) NSMutableArray *modelArray;
/**<#注释#>*/
@property (nonatomic, retain)BH_R_SecondCell_Model *model;

@end
