//
//  BH_D_Section_Details_FirstSection_Model.m
//  SummerQ
//
//  Created by apple on 16/7/26.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_Section_Details_FirstSection_Model.h"

@implementation BH_D_Section_Details_FirstSection_Model
-(void)dealloc{
    [_ID release];
    [_catename release];
    [_catename_en release];
    [_photo release];
    [_beenstr release];
    [_representative release];
    [super dealloc];
}
@end
