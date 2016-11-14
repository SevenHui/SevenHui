//
//  BH_R_SecondCell_Model.m
//  SummerQ
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_SecondCell_Model.h"

@implementation BH_R_SecondCell_Model
-(void)dealloc{
    [_title release];
    [_photo release];
    [_price release];
    [_priceoff release];
    [super dealloc];
}
@end
