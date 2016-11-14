//
//  BH_D_Section_Details_Discount_Model.m
//  SummerQ
//
//  Created by apple on 16/7/26.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_Section_Details_Discount_Model.h"

@implementation BH_D_Section_Details_Discount_Model
-(void)dealloc{
    [_ID release];
    [_title release];
    [_price release];
    [_priceoff release];
    [_expire_date release];
    [_photo release];
    [super dealloc];
}
@end
