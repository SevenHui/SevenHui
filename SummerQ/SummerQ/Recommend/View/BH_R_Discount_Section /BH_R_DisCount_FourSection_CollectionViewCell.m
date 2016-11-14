//
//  BH_R_DisCount_FourSection_CollectionViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/20.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_DisCount_FourSection_CollectionViewCell.h"
@implementation BH_R_DisCount_FourSection_CollectionViewCell
-(void)dealloc{
    [_bigView release];
    [_imageViewPhoto release];
    [_labelTitle release];
    [_labelPrice release];
    [_labelNum release];
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
        
        self.labelTitle = [[UILabel alloc] init];
        [self.bigView addSubview:_labelTitle];
        [self.labelTitle release];
        
        self.labelNum = [[UILabel alloc] init];
        [self.bigView addSubview:_labelNum];
        [self.labelNum release];
        
        self.labelPrice = [[UILabel alloc] init];
        [self.bigView addSubview:_labelPrice];
        [self.labelPrice release];

        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bigView.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
    self.bigView.layer.cornerRadius = 8;
    self.bigView.backgroundColor = [UIColor whiteColor];

    [self.bigView jxl_setDayMode:^(UIView *view) {
        //改变
        self.bigView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.bigView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    
    self.imageViewPhoto.frame = CGRectMake(0, 0, WIDTHVIEW, HEIGHTVIEW * 0.6);
    self.imageViewPhoto.clipsToBounds = YES;
    [self.imageViewPhoto.layer setCornerRadius:8];
    self.imageViewPhoto.layer.shouldRasterize = YES;
//    self.imageViewPhoto.backgroundColor = COLOR;
    
    self.labelTitle.frame = CGRectMake(0, HEIGHTVIEW * 0.6, WIDTHVIEW, HEIGHTVIEW * 0.2);
    self.labelTitle.numberOfLines = 2;
//    self.labelTitle.backgroundColor = [UIColor magentaColor];
    
    self.labelNum.frame = CGRectMake(0, HEIGHTVIEW * 0.88, WIDTHVIEW * 0.4, HEIGHTVIEW * 0.08);
    self.labelNum.textColor = [UIColor grayColor];
//    self.labelNum.backgroundColor = [UIColor greenColor];
    
    self.labelPrice.frame = CGRectMake(WIDTHVIEW * 0.45, HEIGHTVIEW * 0.81, WIDTHVIEW * 0.55, HEIGHTVIEW * 0.2);
//    self.labelPrice.backgroundColor = [UIColor blueColor];

    
}

@end
