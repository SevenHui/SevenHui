//
//  BH_D_Section_Details_firstSec_Details_TableViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/28.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_D_Section_Details_FirstSec_Details_Model;

@interface BH_D_Section_Details_firstSec_Details_TableViewCell : UITableViewCell
/**<#注释#>*/
@property (nonatomic, retain)BH_D_Section_Details_FirstSec_Details_Model *model;

/**背景view*/
@property (nonatomic, retain)UIView *bigView;
/**图片*/
@property (nonatomic, retain)UIImageView *imageViewPhoto;
/**名字*/
@property (nonatomic, retain)UILabel *labelName;
/**说明*/
@property (nonatomic, retain)UILabel *labelDesc;

@end
