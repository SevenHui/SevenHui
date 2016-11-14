//
//  BH_R_LookPack_CollectionViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_LookPack_CollectionViewCell.h"
#import "BH_R_LookPackGuides_Model.h"
@implementation BH_R_LookPack_CollectionViewCell
-(void)dealloc{
    [_bigView release];
    [_imageViewPhoto release];
    [_viewName release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.bigView = [[UIView alloc] init];
        [self addSubview:_bigView];
        [self.bigView release];
        
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self.bigView addSubview:_imageViewPhoto];
        [self.imageViewPhoto release];
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bigView.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
//    self.bigView.backgroundColor = COLOR;
    
    self.imageViewPhoto.frame = CGRectMake(0, 0, WIDTHVIEW, HEIGHTVIEW);
//    self.imageViewPhoto.backgroundColor = COLOR;
    
    
}
-(void)setLookPackGuidesModel:(BH_R_LookPackGuides_Model *)lookPackGuidesModel{
    if (_lookPackGuidesModel != lookPackGuidesModel) {
        [_lookPackGuidesModel release];
        _lookPackGuidesModel = [lookPackGuidesModel retain];
    }
    
    NSString *str = [NSString stringWithFormat:@"%@/260_390.jpg", self.lookPackGuidesModel.cover];
    [self.imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"占位图"]];
    
    
}
@end
