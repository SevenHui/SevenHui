//
//  BHCacheTool.h
//  SummerQ
//
//  Created by apple on 16/8/2.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHCacheTool : NSObject
+ (void)archiverObject:(id)object ByKey:(NSString *)key
              WithPath:(NSString *)path;

+ (id)unarchiverObjectByKey:(NSString *)key
                   WithPath:(NSString *)path;

@end
