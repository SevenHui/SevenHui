//
//  BH_R_Discount_Model.h
//  SummerQ
//
//  Created by apple on 16/7/21.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseModel.h"

@interface BH_R_Discount_Model : BHBaseModel
/**id*/
@property (nonatomic, copy)NSString *ID;
/**类型*/
@property (nonatomic, copy)NSString *type;
/**图片*/
@property (nonatomic, copy)NSString *photo;
/**标题*/
@property (nonatomic, copy)NSString *title;
/**已售件数*/
@property (nonatomic, copy)NSString *sold;
/**起价*/
@property (nonatomic, copy)NSString *price;
/**已收件数*/
@property (nonatomic, copy)NSString *status;
/**<#注释#>*/
@property (nonatomic, retain)NSMutableArray *arrHot_area;

@end
