//
//  BH_R_LookPackGuides_Model.h
//  SummerQ
//
//  Created by apple on 16/7/20.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseModel.h"

@interface BH_R_LookPackGuides_Model : BHBaseModel
/**id*/
@property (nonatomic, copy)NSString *guide_id;
/**名字*/
@property (nonatomic, copy)NSString *name;
/**guides*/
@property (nonatomic, retain)NSMutableArray *arrGuides;
/**中文名*/
@property (nonatomic, copy)NSString *guide_cnname;
/**英文名*/
@property (nonatomic, copy)NSString *guide_enname;
/**图片*/
@property (nonatomic, copy)NSString *cover;

@end
