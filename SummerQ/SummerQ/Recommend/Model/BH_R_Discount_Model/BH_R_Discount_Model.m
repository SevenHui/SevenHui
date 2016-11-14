//
//  BH_R_Discount_Model.m
//  SummerQ
//
//  Created by apple on 16/7/21.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_Discount_Model.h"

@implementation BH_R_Discount_Model
-(void)dealloc{
    [_ID release];
    [_title release];
    [_photo release];
    [_price release];
    [_sold release];
    [_status release];
    [super dealloc];
}
@end
