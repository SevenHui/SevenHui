//
//  BH_D_SecondSection_CollectionViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/16.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_SecondSection_CollectionViewCell.h"

@interface BH_D_SecondSection_CollectionViewCell ()
/**<#注释#>*/
@property (nonatomic, retain)UIView *view;

@end

@implementation BH_D_SecondSection_CollectionViewCell
-(void)dealloc{
    [_labelCnname release];
    [_labelEnname release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.view = [[UIView alloc] init];
        [self addSubview:_view];
        [self.view release];
        
        self.labelCnname = [[UILabel alloc] init];
        [self addSubview:_labelCnname];
        [self.labelCnname release];
        
        self.labelEnname = [[UILabel alloc] init];
        [self addSubview:_labelEnname];
        [self.labelEnname release];
        
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.view.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
    self.view.layer.cornerRadius = 6;
    self.view.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];

    [self.view jxl_setDayMode:^(UIView *view) {
        //改变
        self.view.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        self.view.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    
    self.labelCnname.frame = CGRectMake(0, self.view.frame.size.width * 0.1 * lfheight, self.view.frame.size.width, self.view.frame.size.height * 0.4 * lfheight);
    self.labelCnname.textAlignment = 1;
//    self.labelCnname.backgroundColor = [UIColor redColor];
    
    self.labelEnname.frame = CGRectMake(0, self.view.frame.size.height * 0.5 * lfheight, self.view.frame.size.width, self.view.frame.size.height * 0.4 * lfheight);
    self.labelEnname.textAlignment = 1;
    self.labelCnname.font = [UIFont systemFontOfSize:17 * lfweight];
    self.labelEnname.font = [UIFont systemFontOfSize:17 * lfweight];
//    self.labelEnname.backgroundColor = [UIColor magentaColor];
    
}

@end
