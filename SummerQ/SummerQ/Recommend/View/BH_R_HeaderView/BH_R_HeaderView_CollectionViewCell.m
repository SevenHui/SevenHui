//
//  BH_R_HeaderView_CollectionViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_HeaderView_CollectionViewCell.h"

@implementation BH_R_HeaderView_CollectionViewCell
-(void)dealloc{
    [_bigView release];
    [_imagePhoto release];
    [_labelName release];
    [super dealloc];
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.bigView = [[UIView alloc] init];
        [self addSubview:_bigView];
        [self.bigView release];
        
        self.imagePhoto = [[UIImageView alloc] init];
        [self.bigView addSubview:_imagePhoto];
        [self.imagePhoto release];
        
        self.labelName = [[UILabel alloc] init];
        [self.imagePhoto addSubview:_labelName];
        [self.labelName release];
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bigView.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
    
    self.imagePhoto.frame = CGRectMake(0, 0, WIDTHVIEW, HEIGHTVIEW);
//    self.imagePhoto.backgroundColor = COLOR;

    self.labelName.frame = CGRectMake(45 * lfweight, 30 * lfheight, 100 * lfweight, 20 * lfheight);
    self.labelName.font = [UIFont systemFontOfSize:17 * lfweight];
    self.labelName.textAlignment = 1;
    self.labelName.textColor = [UIColor whiteColor];
    //    self.labelName.backgroundColor = COLOR;
    
    
}

@end
