//
//  BH_D_Section_Details_SecoundSection_TableViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/23.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_D_Section_Details_Discount_Model;

@interface BH_D_Section_Details_SecoundSection_TableViewCell : UITableViewCell
/**<#注释#>*/
@property (nonatomic, retain)BH_D_Section_Details_Discount_Model *discountModel;

/**bigView*/
@property (nonatomic, retain)UIView *bigView;
/**图片*/
@property (nonatomic, retain)UIImageView *imageViewPhoto;
/**标题*/
@property (nonatomic, retain)UILabel *labelTitle;
/**折扣*/
@property (nonatomic, retain)UILabel *labelDiscount;
/**起价*/
@property (nonatomic, retain)UILabel *labelPrice;

@end
