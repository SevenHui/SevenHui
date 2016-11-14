//
//  BH_R_Search_Model.h
//  SummerQ
//
//  Created by apple on 16/8/3.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseModel.h"

@interface BH_R_Search_Model : BHBaseModel
/**id*/
@property (nonatomic, assign) NSInteger id;
/**类型*/
@property (nonatomic, copy) NSString *label;
/**去过人数*/
@property (nonatomic, copy) NSString *beenstr;
/**英文名*/
@property (nonatomic, copy) NSString *enname;
/**分类*/
@property (nonatomic, assign) NSInteger type;
/**中文名*/
@property (nonatomic, copy) NSString *cnname;
/**图片*/
@property (nonatomic, copy) NSString *photo;
/**所属地区*/
@property (nonatomic, retain) NSString *parentname;

@end
