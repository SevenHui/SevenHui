//
//  BH_R_LookPackGuides_Model.m
//  SummerQ
//
//  Created by apple on 16/7/20.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_LookPackGuides_Model.h"

@implementation BH_R_LookPackGuides_Model
-(void)dealloc{
    [_guide_id release];
    [_name release];
    [_guide_cnname release];
    [_guide_enname release];
    [_cover release];
    [_arrGuides release];
    [super dealloc];
}
@end
