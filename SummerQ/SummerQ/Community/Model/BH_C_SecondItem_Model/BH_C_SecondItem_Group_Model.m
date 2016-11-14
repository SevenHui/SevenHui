//
//  BH_C_SecondItem_Group_Model.m
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_C_SecondItem_Group_Model.h"

@implementation BH_C_SecondItem_Group_Model
-(void)dealloc{
    [_name release];
    [_photo release];
    [_total_threads release];
    [super dealloc];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    [super setValue:value forUndefinedKey:key];
    if ([key isEqualToString:@"description"]) {
        self._description = value;
    }
    
}
@end
