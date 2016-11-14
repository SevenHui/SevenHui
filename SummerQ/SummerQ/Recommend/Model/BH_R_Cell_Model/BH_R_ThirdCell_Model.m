//
//  BH_R_ThirdCell_Model.m
//  SummerQ
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_ThirdCell_Model.h"
@implementation BH_R_ThirdCell_Model
-(void)dealloc{
    [_photo release];
    [_title release];
    [_username release];
    [_replys release];
    [_ID release];
    [_user_id release];
    [_lastpost release];
    [super dealloc];
}

@end
