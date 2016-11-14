//
//  BHSJK.h
//  SummerQ
//
//  Created by apple on 16/7/31.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "BH_D_Section_Details_HotCity_Model.h"
@interface BHSJK : NSObject
{
    sqlite3 *DBPoint;
}
+ (BHSJK *)shareInstance;
// 打开
-(void)openDB;
// 关闭
-(void)closeDB;

-(void)createTable;
// 插入
-(void)insert:(BH_D_Section_Details_HotCity_Model *)model;
// 判断是否收藏
- (BOOL)isCollectedInTableadS:(NSString *)id;
// 查找
-(NSMutableArray *)selectAll;
// 删除
-(void)deleteFrom:(NSString *)id;
// 删除所有
-(void)deleteAll;

@end
