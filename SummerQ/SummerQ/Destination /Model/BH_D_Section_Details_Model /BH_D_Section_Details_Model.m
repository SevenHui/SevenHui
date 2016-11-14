//
//  BH_D_Section_Details_Model.m
//  SummerQ
//
//  Created by apple on 16/7/25.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_Section_Details_Model.h"
#import "BH_D_Section_Details_HotCity_Model.h"
@implementation BH_D_Section_Details_Model
-(void)dealloc{
    [_ID release];
    [_cnname release];
    [_enname release];
    [_arrPhotos release];
    [_arrHot_city release];
    [_arrHot_mguide release];
    [_arrNew_discount release];
    [super dealloc];
}

@end
