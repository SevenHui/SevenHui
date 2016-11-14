//
//  BH_D_Smail_Model.h
//  SummerQ
//
//  Created by apple on 16/7/16.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseModel.h"

@interface BH_D_Smail_Model : BHBaseModel
/**id*/
@property (nonatomic, copy)NSString *id;
/**国家中文*/
@property (nonatomic, copy)NSString *cnname;
/**国家英文*/
@property (nonatomic, copy)NSString *enname;
/**图片*/
@property (nonatomic, copy)NSString *photo;
/**数量*/
@property (nonatomic, copy)NSString *count;
/**城市*/
@property (nonatomic, copy)NSString *label;

@end
