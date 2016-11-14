//
//  BH_D_Smail_Model.m
//  SummerQ
//
//  Created by apple on 16/7/16.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_Smail_Model.h"

@implementation BH_D_Smail_Model
-(void)dealloc{
    [_cnname release];
    [_enname release];
    [_photo release];
    [_count release];
    [_label release];
    [super dealloc];
}
@end
