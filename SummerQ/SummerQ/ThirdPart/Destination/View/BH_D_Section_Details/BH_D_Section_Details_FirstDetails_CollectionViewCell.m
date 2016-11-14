//
//  BH_D_Section_Details_FirstDetails_CollectionViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/26.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_Section_Details_FirstDetails_CollectionViewCell.h"
#import "BH_D_Section_Details_FirstSection_Model.h"
@implementation BH_D_Section_Details_FirstDetails_CollectionViewCell
-(void)dealloc{
    [_bigView release];
    [_imageViewPhoto release];
    [_labelCnname release];
    [_labelEnname release];
    [_labelNum release];
    [_labelDeputy release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 背景view
        self.bigView = [[UIView alloc] init];
        [self addSubview:_bigView];
        // 图片
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self.bigView addSubview:_imageViewPhoto];
        //中文名
        self.labelCnname = [[UILabel alloc] init];
        [self.imageViewPhoto addSubview:_labelCnname];
        //英文名
        self.labelEnname = [[UILabel alloc] init];
        [self.imageViewPhoto addSubview:_labelEnname];
        //去过人数
        self.labelNum = [[UILabel alloc] init];
        [self.bigView addSubview:_labelNum];
        // 代表景点
        self.labelDeputy = [[UILabel alloc] init];
        [self.bigView addSubview:_labelDeputy];
    
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    // 背景view
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
    self.imageViewPhoto.frame = CGRectMake(0, 0, WIDTHVIEW, HEIGHTVIEW * 0.6);
//    self.imageViewPhoto.backgroundColor = COLOR;
    // 中文名
    self.labelCnname.frame = CGRectMake(10 * lfweight, self.imageViewPhoto.frame.size.height * 0.6, self.imageViewPhoto.frame.size.width * 0.5, self.imageViewPhoto.frame.size.height * 0.15);
    self.labelCnname.textColor = [UIColor whiteColor];
//    self.labelCnname.backgroundColor = [UIColor orangeColor];
    // 英文名
    self.labelEnname.frame = CGRectMake(10 * lfweight, self.imageViewPhoto.frame.size.height * 0.75, self.imageViewPhoto.frame.size.width * 0.5, self.imageViewPhoto.frame.size.height * 0.15);
    self.labelEnname.textColor = [UIColor whiteColor];
//    self.labelEnname.backgroundColor = [UIColor magentaColor];
    // 去过人数
    self.labelNum.frame = CGRectMake(10 * lfweight, HEIGHTVIEW * 0.65, WIDTHVIEW - 20 * lfweight, HEIGHTVIEW * 0.1);
//    self.labelNum.backgroundColor = [UIColor orangeColor];
    // 代表景点
    self.labelDeputy.frame = CGRectMake(10 * lfweight, HEIGHTVIEW * 0.78, WIDTHVIEW - 20 * lfweight, HEIGHTVIEW * 0.2);
    self.labelDeputy.numberOfLines = 2;
//    self.labelDeputy.backgroundColor = [UIColor purpleColor];
    
}
-(void)setModel:(BH_D_Section_Details_FirstSection_Model *)model{
    if (_model != model) {
        [_model release];
        _model = [model retain];
    }
    [self.imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:[UIImage imageNamed:@"占位图"]];
    self.labelCnname.text = model.catename;
    self.labelEnname.text = model.catename_en;
    self.labelNum.text = model.beenstr;
    self.labelDeputy.text = model.representative;
    
}






@end
