//
//  BH_C_SecoundItem_Details_TableViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/28.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_C_SecoundItem_Details_Model;

@interface BH_C_SecoundItem_Details_TableViewCell : UITableViewCell
/**<#注释#>*/
@property (nonatomic, retain)BH_C_SecoundItem_Details_Model *model;

/**<#注释#>*/
@property (nonatomic, retain)UIView *bigView;
/**<#注释#>*/
@property (nonatomic, retain)UIImageView *imageViewPhoto;
/**<#注释#>*/
@property (nonatomic, retain)UILabel *labelTitle;

@end
