//
//  BH_R_Search_Model.m
//  SummerQ
//
//  Created by apple on 16/8/3.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_Search_Model.h"

@implementation BH_R_Search_Model
-(void)dealloc{
    [_label release];
    [_beenstr release];
    [_enname release];
    [_cnname release];
    [_photo release];
    [_parentname release];
    [super dealloc];
}
@end
