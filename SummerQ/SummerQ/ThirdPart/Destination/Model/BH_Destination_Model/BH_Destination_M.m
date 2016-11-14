//
//  BH_Destination_M.m
//  SummerQ
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_Destination_M.h"
#import "BH_D_Smail_Model.h"

@implementation BH_Destination_M
-(void)dealloc{
    [_ID release];
    [_cnname release];
    [super dealloc];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"hot_country"]) {
        self.arrHot_country = [NSMutableArray array];
        for (NSDictionary *dic in value) {
            BH_D_Smail_Model *model = [[BH_D_Smail_Model alloc] initWithDic:dic];
            [self.arrHot_country addObject:model];
        }
    }
    
    if ([key isEqualToString:@"country"]) {
        self.arrCountry = [NSMutableArray array];
        for (NSDictionary *dic in value) {
            BH_D_Smail_Model *model = [[BH_D_Smail_Model alloc] initWithDic:dic];
            [self.arrCountry addObject:model];
        }
    }
    
}


@end
