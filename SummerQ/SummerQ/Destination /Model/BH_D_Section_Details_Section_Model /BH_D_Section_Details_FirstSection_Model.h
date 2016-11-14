//
//  BH_D_Section_Details_FirstSection_Model.h
//  SummerQ
//
//  Created by apple on 16/7/26.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseModel.h"

@interface BH_D_Section_Details_FirstSection_Model : BHBaseModel
/**<#注释#>*/
@property (nonatomic, copy)NSString *ID;
/**中文名*/
@property (nonatomic, copy)NSString *catename;
/**英文名*/
@property (nonatomic, copy)NSString *catename_en;
/**图片*/
@property (nonatomic, copy)NSString *photo;
/**去过人数*/
@property (nonatomic, copy)NSString *beenstr;
/**代表景点*/
@property (nonatomic, copy)NSString *representative;

@end
