//
//  BH_C_ThirdItem_Model.m
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_C_ThirdItem_Model.h"

@implementation BH_C_ThirdItem_Model
-(void)dealloc{
    [_title release];
    [_uid release];
    [_username release];
    [_citys_str release];
    [_end_time release];
    [_publish_time release];
    [_views release];
    [_start_time release];
    [_appview_url release];
    [super dealloc];
}
@end
