//
//  BH_R_DisCount_FirstSection_TableViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/20.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_R_Discount_Model;

@interface BH_R_DisCount_FirstSection_TableViewCell : UITableViewCell
/**<#注释#>*/
@property (nonatomic, retain)BH_R_Discount_Model *discountModel;

/**图片*/
@property (nonatomic, retain)UIImageView *imageViewPhoto;
/**标题*/
@property (nonatomic, retain)UILabel *labelTitle;
/**已售件数*/
@property (nonatomic, retain)UILabel *labelNum;
/**起价*/
@property (nonatomic, retain)UILabel *labelPrice;

@end
