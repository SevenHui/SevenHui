//
//  BH_C_SecoundItem_Details_Model.m
//  SummerQ
//
//  Created by apple on 16/7/28.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_C_SecoundItem_Details_Model.h"

@implementation BH_C_SecoundItem_Details_Model
-(void)dealloc{
    [_photo release];
    [_title release];
    [_view_url release];
    [super dealloc];
}
@end
