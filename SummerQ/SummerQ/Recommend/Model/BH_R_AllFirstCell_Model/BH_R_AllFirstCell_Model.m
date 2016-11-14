//
//  BH_R_AllFirstCell_Model.m
//  SummerQ
//
//  Created by apple on 16/7/21.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_AllFirstCell_Model.h"

@implementation BH_R_AllFirstCell_Model
-(void)dealloc{
    [_title release];
    [_url release];
    [_photo release];
    [super dealloc];
}
@end
