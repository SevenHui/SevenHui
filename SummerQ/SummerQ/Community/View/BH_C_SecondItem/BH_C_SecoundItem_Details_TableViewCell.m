//
//  BH_C_SecoundItem_Details_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/28.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_C_SecoundItem_Details_TableViewCell.h"
#import "BH_C_SecoundItem_Details_Model.h"
@implementation BH_C_SecoundItem_Details_TableViewCell
-(void)dealloc{
    [_bigView release];
    [_imageViewPhoto release];
    [_labelTitle release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.bigView = [[UIView alloc] init];
        [self addSubview:_bigView];
        [self.bigView release];
        
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self.bigView addSubview:_imageViewPhoto];
        [self.imageViewPhoto release];
        
        self.labelTitle = [[UILabel alloc] init];
        [self.bigView addSubview:_labelTitle];
        [self.labelTitle release];
        
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bigView.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
    self.bigView.backgroundColor = [UIColor whiteColor];
    
    self.imageViewPhoto.frame = CGRectMake(0, 0, WIDTHVIEW, HEIGHTVIEW * 0.65);
//    self.imageViewPhoto.backgroundColor = COLOR;
    
    self.labelTitle.frame = CGRectMake(0, HEIGHTVIEW * 0.65, WIDTHVIEW, HEIGHTVIEW * 0.35);
    self.labelTitle.numberOfLines = 2;
    
}
-(void)setModel:(BH_C_SecoundItem_Details_Model *)model{
    if (_model != model) {
        [_model release];
        _model = [model retain];
    }
    
    [self.imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:[UIImage imageNamed:@"占位图"]];
    self.labelTitle.text = model.title;
    
    
}


@end
