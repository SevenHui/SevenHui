//
//  BH_C_Navigation_CollectionViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  热议 进入版面 寻旅伴_cell

#import "BH_C_Navigation_CollectionViewCell.h"

@interface BH_C_Navigation_CollectionViewCell ()
/**<#注释#>*/
@property (nonatomic, retain)UILabel *labelName;

@end

@implementation BH_C_Navigation_CollectionViewCell
-(void)dealloc{
    [_naviStr release];
    [_labelName release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.labelName = [[UILabel alloc] init];
        [self addSubview:_labelName];
        [self.labelName release];
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.labelName.frame = self.bounds;
//    self.labelName.backgroundColor = [UIColor redColor];
    self.labelName.textAlignment = 1;
    self.labelName.textColor = [UIColor whiteColor];
    
}
-(void)setNaviStr:(NSString *)naviStr
{
    if (_naviStr != naviStr) {
        [_naviStr release];
        _naviStr = [naviStr retain];
    }
    self.labelName.text = naviStr;
    
}

@end
