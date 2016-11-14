//
//  BH_D_Section_Details_FirstSection_CollectionViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/25.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_Section_Details_FirstSection_CollectionViewCell.h"

@implementation BH_D_Section_Details_FirstSection_CollectionViewCell
-(void)dealloc{
    [_bigView release];
    [_labelCnname release];
    [_labelEnname release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // bigView
        self.bigView = [[UIView alloc] init];
        [self addSubview:_bigView];
        // 图片
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self.bigView addSubview:_imageViewPhoto];
        // 中文名
        self.labelCnname = [[UILabel alloc] init];
        [self.imageViewPhoto addSubview:_labelCnname];
        // 英文名
        self.labelEnname = [[UILabel alloc] init];
        [self.imageViewPhoto addSubview:_labelEnname];
        
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    // bigView
    self.bigView.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
    self.bigView.backgroundColor = [UIColor whiteColor];
    // 图片
    self.imageViewPhoto.frame = CGRectMake(0, 0, WIDTHVIEW, HEIGHTVIEW);
//    self.imageViewPhoto.backgroundColor = COLOR;
    // 中文名
    self.labelCnname.frame = CGRectMake(10 * lfweight, self.imageViewPhoto.frame.size.height * 0.6, self.imageViewPhoto.frame.size.width * 0.5, self.imageViewPhoto.frame.size.height * 0.15);
    self.labelCnname.textColor = [UIColor whiteColor];
//    self.labelCnname.backgroundColor = [UIColor yellowColor];
    // 英文名
    self.labelEnname.frame = CGRectMake(10 * lfweight, self.imageViewPhoto.frame.size.height * 0.75, self.imageViewPhoto.frame.size.width * 0.5, self.imageViewPhoto.frame.size.height * 0.15);
    self.labelEnname.textColor = [UIColor whiteColor];
//    self.labelEnname.backgroundColor = [UIColor redColor];
    
    
    
}
@end
