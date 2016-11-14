//
//  BH_Destination_M.h
//  SummerQ
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseModel.h"

@interface BH_Destination_M : BHBaseModel
/**id*/
@property (nonatomic, copy)NSString *ID;
/**大洲名*/
@property (nonatomic, copy)NSString *cnname;
/**热门目的地_hot_country*/
@property (nonatomic, retain)NSMutableArray *arrHot_country;
/**其他目的地_country*/
@property (nonatomic, retain)NSMutableArray *arrCountry;

@end
