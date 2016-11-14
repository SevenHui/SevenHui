//
//  BH_C_GroupTableView_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_C_GroupTableView_TableViewCell.h"
#import "BH_C_SecondItem_Group_Model.h"
@implementation BH_C_GroupTableView_TableViewCell
-(void)dealloc{
    [_imageViewPhoto release];
    [_labelName release];
    [_labelDescription release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 头像
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self addSubview:_imageViewPhoto];
        [self.imageViewPhoto release];
        // 名字
        self.labelName = [[UILabel alloc] init];
        [self addSubview:_labelName];
        [self.labelName release];
        // 描述
        self.labelDescription = [[UILabel alloc] init];
        [self addSubview:_labelDescription];
        [self.labelDescription release];
        
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageViewPhoto.frame = CGRectMake(20 * lfweight, 20 * lfheight, 60 * lfweight, 60 * lfheight);
    self.imageViewPhoto.layer.cornerRadius = 8;
//    self.imageViewPhoto.backgroundColor = COLOR;
    
    self.labelName.frame = CGRectMake(WIDTH1 * 0.2 + 30 * lfweight, 30 * lfheight, WIDTH1 * 0.6, HEIGHT1 * 0.1);
    
    self.labelDescription.frame = CGRectMake(WIDTH1 * 0.2 + 30 * lfweight, WIDTH1 * 0.2, WIDTH1 - (WIDTH1 * 0.2 + 30 * lfweight), HEIGHT1 * 0.1);
    self.labelDescription.textColor = [UIColor grayColor];
    
}
-(void)setGroupCellModel:(BH_C_SecondItem_Group_Model *)groupCellModel{
    if (_groupCellModel != groupCellModel) {
        [_groupCellModel release];
        _groupCellModel = [groupCellModel retain];
    }
    
    [self.imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:self.groupCellModel.photo] placeholderImage:[UIImage imageNamed:@"占位图"]];
    
    self.labelName.text = self.groupCellModel.name;
    
    self.labelDescription.text = self.groupCellModel._description;
    
    
}


@end
