//
//  BH_C_ThirdItem_Model.h
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseModel.h"

@interface BH_C_ThirdItem_Model : BHBaseModel
/**title*/
@property (nonatomic, copy)NSString *title;
/**citys_str*/
@property (nonatomic, copy)NSString *citys_str;
/**start_time*/
@property (nonatomic, copy)NSString *start_time;
/**end_time*/
@property (nonatomic, copy)NSString *end_time;
/**publish_time*/
@property (nonatomic, copy)NSString *publish_time;
/**uid*/
@property (nonatomic, copy)NSString *uid;
/**username*/
@property (nonatomic, copy)NSString *username;
/**views*/
@property (nonatomic, copy)NSString *views;

/**appview_url*/
@property (nonatomic, copy)NSString *appview_url;

@end
