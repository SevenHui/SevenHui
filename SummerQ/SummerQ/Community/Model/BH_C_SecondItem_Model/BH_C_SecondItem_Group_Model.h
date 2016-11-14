//
//  BH_C_SecondItem_Group_Model.h
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseModel.h"

@interface BH_C_SecondItem_Group_Model : BHBaseModel
/**头像*/
@property (nonatomic, copy)NSString *photo;
/**名字*/
@property (nonatomic, copy)NSString *name;
/**描述*/
@property (nonatomic, copy)NSString *_description;
/**帖子个数*/
@property (nonatomic, copy)NSString *total_threads;

@end
