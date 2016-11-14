//
//  BH_C_FirstItem_Model.h
//  SummerQ
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseModel.h"

@interface BH_C_FirstItem_Model : BHBaseModel
/**id*/
@property (nonatomic, copy)NSString *ID;
/**title*/
@property (nonatomic, copy)NSString *title;
/**bigpic_arr*/
@property (nonatomic, retain)NSMutableArray *bigpic_arr;
/**author*/
@property (nonatomic, copy)NSString *author;
/**user_id*/
@property (nonatomic, copy)NSString *user_id;
/**avatar*/
@property (nonatomic, copy)NSString *avatar;
/**forum*/
@property (nonatomic, copy)NSString *forum;
/**forum_id*/
@property (nonatomic, copy)NSString *forum_id;
/**reply_num*/
@property (nonatomic, copy)NSString *reply_num;
/**reply_time*/
@property (nonatomic, copy)NSString *reply_time;
/**is_hot*/
@property (nonatomic, copy)NSString *is_hot;
/**is_best*/
@property (nonatomic, copy)NSString *is_best;
/**type*/
@property (nonatomic, copy)NSString *type;
/**appview_url*/
@property (nonatomic, copy)NSString *appview_url;

@end
