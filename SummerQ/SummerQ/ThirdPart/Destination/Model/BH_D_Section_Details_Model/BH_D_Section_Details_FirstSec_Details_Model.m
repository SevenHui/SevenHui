//
//  BH_D_Section_Details_FirstSec_Details_Model.m
//  SummerQ
//
//  Created by apple on 16/7/28.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_Section_Details_FirstSec_Details_Model.h"

@implementation BH_D_Section_Details_FirstSec_Details_Model
-(void)dealloc{
    [_Id release];
    [_name release];
    [_desc release];
    [_pic_url release];
    [super dealloc];
}
@end
