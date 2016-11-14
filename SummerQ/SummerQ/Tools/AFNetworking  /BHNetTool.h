//
//  BHNetTool.h
//  SummerQ
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <Foundation/Foundation.h>

// 成功回调
typedef void(^successBlock) (id result);
// 失败回调
typedef void(^failureBlock) (NSError *error);

typedef NS_ENUM(NSUInteger, BHResponseStyle) {
    BHJSON,
    BHDATA,
    BHXML,
};

typedef NS_ENUM(NSUInteger, BHRequestStyle) {
    BHBodyString,
    BHBodyJSON,
};


@interface BHNetTool : NSObject

+(void)GET:(NSString *)url
      body:(id)body
headerFile:(NSDictionary *)headers
  response:(BHResponseStyle)responseStyle
   success:(successBlock)success
   failure:(failureBlock)failure;

+(void)POST:(NSString *)url
      body:(id)body
  bodyStyle:(BHRequestStyle)bodyStyle
headerFile:(NSDictionary *)headers
  response:(BHResponseStyle)responseStyle
   success:(successBlock)success
   failure:(failureBlock)failure;


@end
