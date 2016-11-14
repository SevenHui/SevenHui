//
//  BH_C_FirstItem_Model.m
//  SummerQ
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_C_FirstItem_Model.h"

@implementation BH_C_FirstItem_Model
-(void)dealloc{
    [_ID release];
    [_title release];
    [_author release];
    [_user_id release];
    [_avatar release];
    [_forum release];
    [_forum_id release];
    [_reply_num release];
    [_reply_time release];
    [_is_best release];
    [_is_hot release];
    [_type release];
    [_appview_url release];
    [super dealloc];
}
@end
