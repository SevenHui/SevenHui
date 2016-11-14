//
//  BH_D_Section_Details_firstSec_Details_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/28.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_Section_Details_firstSec_Details_TableViewCell.h"
#import "BH_D_Section_Details_FirstSec_Details_Model.h"
@implementation BH_D_Section_Details_firstSec_Details_TableViewCell
-(void)dealloc{
    [_bigView release];
    [_imageViewPhoto release];
    [_labelName release];
    [_labelDesc release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 背景view
        self.bigView = [[UIView alloc] init];
        [self addSubview:_bigView];
        [self.bigView release];
        // 图片
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self.bigView addSubview:_imageViewPhoto];
        [self.imageViewPhoto release];
        // 名字
        self.labelName = [[UILabel alloc] init];
        [self.imageViewPhoto addSubview:_labelName];
        [self.labelName release];
        // 说明
        self.labelDesc = [[UILabel alloc] init];
        [self.bigView addSubview:_labelDesc];
        [self.labelDesc release];
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    //背景view
    self.bigView.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
    self.bigView.backgroundColor = [UIColor whiteColor];

    [self.bigView jxl_setDayMode:^(UIView *view) {
        //改变
        self.bigView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.bigView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    // 图片
    self.imageViewPhoto.frame = CGRectMake(0, 0, WIDTHVIEW, HEIGHTVIEW * 0.7);
//    self.imageViewPhoto.backgroundColor = COLOR;
    // 名字
    self.labelName.frame = CGRectMake(0, self.imageViewPhoto.frame.size.height / 2 - (self.imageViewPhoto.frame.size.height * 0.1), self.imageViewPhoto.frame.size.width, self.imageViewPhoto.frame.size.height * 0.2);
    self.labelName.textColor = [UIColor whiteColor];
    self.labelName.textAlignment = 1;
    self.labelName.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
//    self.labelName.backgroundColor = [UIColor magentaColor];
    // 说明
    self.labelDesc.frame = CGRectMake(0, HEIGHTVIEW * 0.7, WIDTHVIEW, HEIGHTVIEW - (HEIGHTVIEW * 0.7));
    self.labelDesc.numberOfLines = 2;
//    self.labelDesc.backgroundColor = [UIColor purpleColor];
    
}
-(void)setModel:(BH_D_Section_Details_FirstSec_Details_Model *)model{
    if (_model != model) {
        [_model release];
        _model = [model retain];
    }
    [self.imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:self.model.pic_url] placeholderImage:[UIImage imageNamed:@"占位图"]];
    self.labelName.text = self.model.name;
    self.labelDesc.text = self.model.desc;
    
}
@end
