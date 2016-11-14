//
//  BH_D_Section_Details_HotCity_Model.m
//  SummerQ
//
//  Created by apple on 16/7/26.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_Section_Details_HotCity_Model.h"

@implementation BH_D_Section_Details_HotCity_Model
-(void)dealloc{
    [_id release];
    [_cnname release];
    [_enname release];
    [_photo release];
    [super dealloc];
}

@end
