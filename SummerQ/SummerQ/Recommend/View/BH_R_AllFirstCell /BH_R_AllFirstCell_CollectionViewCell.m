//
//  BH_R_AllFirstCell_CollectionViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/21.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_AllFirstCell_CollectionViewCell.h"
#import "BH_R_AllFirstCell_Model.h"
@implementation BH_R_AllFirstCell_CollectionViewCell
-(void)dealloc{
    [_allFirstCellModel release];
    [_imageViewPhoto release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self addSubview:_imageViewPhoto];
        [self.imageViewPhoto release];
        
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageViewPhoto.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
    
    
}
-(void)setAllFirstCellModel:(BH_R_AllFirstCell_Model *)allFirstCellModel{
    if (_allFirstCellModel != allFirstCellModel) {
        [_allFirstCellModel release];
        _allFirstCellModel = [allFirstCellModel retain];
    }
    
    [self.imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:self.allFirstCellModel.photo] placeholderImage:[UIImage imageNamed:@"占位图"]];
    
    
}
@end
