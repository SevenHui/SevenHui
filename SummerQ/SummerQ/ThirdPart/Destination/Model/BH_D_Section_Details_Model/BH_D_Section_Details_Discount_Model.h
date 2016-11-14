//
//  BH_D_Section_Details_Discount_Model.h
//  SummerQ
//
//  Created by apple on 16/7/26.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  超值自由行Model

#import "BHBaseModel.h"

@interface BH_D_Section_Details_Discount_Model : BHBaseModel
/**<#注释#>*/
@property (nonatomic, copy)NSString *ID;
/**标题*/
@property (nonatomic, copy)NSString *title;
/**起价*/
@property (nonatomic, copy)NSString *price;
/**折扣*/
@property (nonatomic, copy)NSString *priceoff;
/**结束日期*/
@property (nonatomic, copy)NSString *expire_date;
/**图片*/
@property (nonatomic, copy)NSString *photo;

@end
