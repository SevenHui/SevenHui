//
//  BHBaseModel.m
//  SummerQ
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseModel.h"

@implementation BHBaseModel

-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

-(void)setNilValueForKey:(NSString *)key{
    
}

@end
