//
//  BH_R_LookPack_Model.m
//  SummerQ
//
//  Created by apple on 16/7/27.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_LookPack_Model.h"

@implementation BH_R_LookPack_Model
-(void)dealloc{
    [_cnname release];
    [_idd release];
    [super dealloc];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.idd = value;
    }
}

@end
