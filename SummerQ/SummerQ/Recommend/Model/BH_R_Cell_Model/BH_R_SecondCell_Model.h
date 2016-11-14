//
//  BH_R_SecondCell_Model.h
//  SummerQ
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseModel.h"

@interface BH_R_SecondCell_Model : BHBaseModel
/**<#注释#>*/
@property (nonatomic, assign)NSInteger id;
/**标题*/
@property (nonatomic, copy)NSString *title;
/**图片*/
@property (nonatomic, copy)NSString *photo;
/**价格*/
@property (nonatomic, copy)NSString *price;
/**折价*/
@property (nonatomic, copy)NSString *priceoff;

@end
