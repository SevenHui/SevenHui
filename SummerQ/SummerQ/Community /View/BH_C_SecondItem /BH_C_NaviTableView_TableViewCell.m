//
//  BH_C_NaviTableView_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_C_NaviTableView_TableViewCell.h"
#import "BH_C_SecondItem_Model.h"
@implementation BH_C_NaviTableView_TableViewCell
-(void)dealloc{
    [_labelName release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.labelName = [[UILabel alloc] init];
        [self addSubview:_labelName];
        [self.labelName release];
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.labelName.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
    self.labelName.textAlignment = 1;
//    self.labelName.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    
    
    
}
-(void)setNaviCellModel:(BH_C_SecondItem_Model *)naviCellModel{
    if (_naviCellModel != naviCellModel) {
        [_naviCellModel release];
        _naviCellModel = [naviCellModel retain];
    }
    
    self.labelName.text = self.naviCellModel.name;
    
}
@end
