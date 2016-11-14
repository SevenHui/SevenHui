//
//  BHSearchBar.m
//  SummerQ
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHSearchBar.h"

@implementation BHSearchBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tintColor = [UIColor clearColor];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    UITextField *searchField = nil;
    if (searchField) {
        searchField.textAlignment = NSTextAlignmentLeft;
        searchField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 20)];
        [searchField setTintColor:[UIColor blueColor]];
        [searchField setBorderStyle:UITextBorderStyleRoundedRect];
        [searchField setBackgroundColor:[UIColor colorWithRed:0.000 green:0.337 blue:0.670 alpha:1.000]];
        [searchField setTextColor:[UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.00f]];
        searchField.center = self.center;
    }
    //外部背景
    UIView *outView = [[UIView alloc] initWithFrame:self.bounds];
    [outView jxl_setDayMode:^(UIView *view) {
        [outView setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00]];
    } nightMode:^(UIView *view) {
        [outView setBackgroundColor:[UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00]];
    }];
    [self insertSubview:outView atIndex:1];
}

@end
