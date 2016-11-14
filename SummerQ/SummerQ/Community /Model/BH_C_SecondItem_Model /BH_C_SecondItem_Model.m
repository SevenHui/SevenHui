//
//  BH_C_SecondItem_Model.m
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_C_SecondItem_Model.h"
#import "BH_C_SecondItem_Group_Model.h"
@implementation BH_C_SecondItem_Model
-(void)dealloc{
    [_arrGroup release];
    [_name release];
    [super dealloc];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"group"]) {
        self.arrGroup = [NSMutableArray array];
        for (NSDictionary *dic in value) {
            BH_C_SecondItem_Group_Model *model = [[BH_C_SecondItem_Group_Model alloc] initWithDic:dic];
            [self.arrGroup addObject:model];
        }
    }
}
@end
