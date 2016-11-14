
//
//  BHSJK.m
//  SummerQ
//
//  Created by apple on 16/7/31.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHSJK.h"

@interface BHSJK ()
/**<#注释#>*/
@property (nonatomic, retain)BHSJK *handler;

@end

@implementation BHSJK

+ (BHSJK *)shareInstance{
    static BHSJK *dataBase = nil;
    if (dataBase == nil) {
        dataBase = [[BHSJK alloc] init];
        [dataBase openDB];
        [dataBase createTable];
    }
    return dataBase;
}
#pragma mark - 打开数据库
- (void)openDB{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dbPath = [docPath stringByAppendingPathComponent:@"file.sqlite"];
    NSLog(@"%@",dbPath);
    int result = sqlite3_open([dbPath UTF8String], &DBPoint);
    if (result == SQLITE_OK) {
        NSLog(@"数据库打开成功");
    }
    else{
        NSLog(@"数据库打开失败");
    }
}
#pragma mark - 创建表
- (void)createTable{
    NSString *string = [NSString stringWithFormat:@"create table if not exists tourist(Id text primary key,cnname text,photo text)"];
    int result = sqlite3_exec(DBPoint,[string UTF8String],NULL,NULL,NULL);
    if (result == SQLITE_OK) {
        NSLog(@"创建表成功");
    }
    
    else{
        NSLog(@"创建表失败");
    }
}
#pragma mark -- 插入数据
- (void)insert:(BH_D_Section_Details_HotCity_Model *)model{
    NSString *sqliteStr = [NSString stringWithFormat:@"insert into tourist values('%@','%@','%@')",model.id ,model.cnname,model.photo];
    int result = sqlite3_exec(DBPoint, [sqliteStr UTF8String], nil, nil, nil);
    
    if (result == SQLITE_OK) {
        NSLog(@"添加教程成功");
    }else{
        NSLog(@"添加教程失败%d",result);
    }
    
}
#pragma mark -- 判断是否收藏
- (BOOL)isCollectedInTableadS:(NSString *)id{
    BOOL isCollected = 0;
    //打开数据库
    [self openDB];
    NSString *sqlString = [NSString stringWithFormat:@"select * from tourist where id = '%@'",id];
    //创建伴随指针:
    sqlite3_stmt *stmt = NULL;
    //预执行语句:
    int result = sqlite3_prepare(DBPoint, sqlString.UTF8String, -1, &stmt, NULL);
    
    if (result == SQLITE_OK) {
        // 成功
        if (sqlite3_step(stmt) == SQLITE_ROW)
        {
            // 已在表中
            sqlite3_finalize(stmt);

            return YES;
        }
        // 未在表中
        sqlite3_finalize(stmt);

        return NO;
    }else
    {
        // 失败
        sqlite3_finalize(stmt);
    }
    return isCollected;
}

#pragma mark - 查找
-(NSMutableArray *)selectAll{
    NSString *sqlStr = @"select * from tourist";
    NSMutableArray *courseArr = [NSMutableArray array];
    
    sqlite3_stmt *stmt = nil;
    
    int result = sqlite3_prepare_v2(DBPoint, [sqlStr UTF8String], -1, &stmt, nil);
    if (result == SQLITE_OK) {
        NSLog(@"查询收藏所有表格成功!");
        while (sqlite3_step(stmt) == SQLITE_ROW) {
//            const unsigned char *Id = sqlite3_column_text(stmt, 0);
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            const unsigned char *photo = sqlite3_column_text(stmt, 2);
            
            NSString *model_name = [NSString stringWithUTF8String:(const char *)name];
            NSString *model_photo = [NSString stringWithUTF8String:(const char *)photo];
            
            BH_D_Section_Details_HotCity_Model *model = [[BH_D_Section_Details_HotCity_Model alloc] init];
//            model.id = Id;
            model.cnname = model_name;
            model.photo = model_photo;
            [courseArr addObject:model];
            
        }
    }else{
        sqlite3_finalize(stmt);
        NSLog(@"查询教程失败");
    }
    sqlite3_finalize(stmt);
    return courseArr;
}

#pragma mark - 删除数据
-(void)deleteFrom:(NSString *)id{
    NSString *sql = [NSString stringWithFormat:@"delete from tourist where id = '%@'", id];
    
    int result = sqlite3_exec(DBPoint, [sql UTF8String], NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败");
    }
}
#pragma mark - 删除所有
-(void)deleteAll{
    NSString *sql = @"delete from tourist";
    int result = sqlite3_exec(DBPoint, [sql UTF8String], NULL, NULL, NULL);

    if (result == SQLITE_OK) {
        NSLog(@"删除全部成功");
    }else{
        NSLog(@"删除全部失败");
    }
}



@end
