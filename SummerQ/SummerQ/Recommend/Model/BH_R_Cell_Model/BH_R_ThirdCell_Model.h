//
//  BH_R_ThirdCell_Model.h
//  SummerQ
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseModel.h"

@interface BH_R_ThirdCell_Model : BHBaseModel
/**图片*/
@property (nonatomic, copy)NSString *photo;
/**标题*/
@property (nonatomic, copy)NSString *title;
/**昵称*/
@property (nonatomic, copy)NSString *username;
/**查看*/
@property (nonatomic, assign)NSInteger views;
/**评论*/
@property (nonatomic, copy)NSString *replys;
/**id*/
@property (nonatomic, copy)NSString *ID;
/**user_id*/
@property (nonatomic, copy)NSString *user_id;
/**详情WebView*/
@property (nonatomic, copy)NSString *view_url;
/**lastpost*/
@property (nonatomic, copy)NSString *lastpost;

@end
