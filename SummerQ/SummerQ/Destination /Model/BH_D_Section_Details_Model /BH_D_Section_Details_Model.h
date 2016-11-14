//
//  BH_D_Section_Details_Model.h
//  SummerQ
//
//  Created by apple on 16/7/25.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  国家详情Model

#import "BHBaseModel.h"

@interface BH_D_Section_Details_Model : BHBaseModel
/**id*/
@property (nonatomic, copy)NSString *ID;
/**中文名字*/
@property (nonatomic, copy)NSString *cnname;
/**英文名字*/
@property (nonatomic, copy)NSString *enname;
/**轮播图数组*/
@property (nonatomic, retain)NSMutableArray *arrPhotos;
/**热门城市*/
@property (nonatomic, retain)NSMutableArray *arrHot_city;
/**hot_mguide*/
@property (nonatomic, retain)NSMutableArray *arrHot_mguide;
/**超值自由行*/
@property (nonatomic, retain)NSMutableArray *arrNew_discount;

@end
