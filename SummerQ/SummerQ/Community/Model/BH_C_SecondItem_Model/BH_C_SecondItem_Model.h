//
//  BH_C_SecondItem_Model.h
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseModel.h"

@interface BH_C_SecondItem_Model : BHBaseModel
/**名字*/
@property (nonatomic, copy)NSString *name;
/**具体数组*/
@property (nonatomic, retain)NSMutableArray *arrGroup;

@end
