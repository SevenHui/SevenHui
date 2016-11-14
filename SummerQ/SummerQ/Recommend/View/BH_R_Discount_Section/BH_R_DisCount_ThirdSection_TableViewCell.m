//
//  BH_R_DisCount_ThirdSection_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/20.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_DisCount_ThirdSection_TableViewCell.h"
#import "BH_R_Discount_Model.h"
@implementation BH_R_DisCount_ThirdSection_TableViewCell
-(void)dealloc{
    [_imageViewPhoto release];
    [_labelNum release];
    [_labelPrice release];
    [_labelTitle release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self addSubview:_imageViewPhoto];
        [self.imageViewPhoto release];
        
        self.labelTitle = [[UILabel alloc] init];
        [self addSubview:_labelTitle];
        [self.labelTitle release];
        
        self.labelNum = [[UILabel alloc] init];
        [self addSubview:_labelNum];
        [self.labelNum release];
        
        self.labelPrice = [[UILabel alloc] init];
        [self addSubview:_labelPrice];
        [self.labelPrice release];
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageViewPhoto.frame = CGRectMake(10 * lfweight, 10 * lfweight, WIDTH1 * 0.3, HEIGHT1 - 20 * lfheight);
//    self.imageViewPhoto.backgroundColor = COLOR;
    
    self.labelTitle.frame = CGRectMake(20 * lfweight + WIDTH1 * 0.3, 10 * lfheight, WIDTH1 - (20 * lfweight + WIDTH1 * 0.3) - 10 * lfweight, HEIGHT1 * 0.4);
    self.labelTitle.numberOfLines = 2;
//    self.labelTitle.backgroundColor = [UIColor magentaColor];
    
    self.labelNum.frame = CGRectMake(20 * lfweight + WIDTH1 * 0.3, HEIGHT1 * 0.7, WIDTH1 * 0.3, HEIGHT1 * 0.2);
    self.labelNum.textColor = [UIColor grayColor];
//    self.labelNum.backgroundColor = [UIColor greenColor];
    
    self.labelPrice.frame = CGRectMake(WIDTH1 * 0.7, HEIGHT1 * 0.65, WIDTH1 * 0.3, HEIGHT1 * 0.3);
//    self.labelPrice.backgroundColor = [UIColor blueColor];
    
}
-(void)setDiscountThirdModel:(BH_R_Discount_Model *)discountThirdModel{
    if (_discountThirdModel != discountThirdModel) {
        [_discountThirdModel release];
        _discountThirdModel = [discountThirdModel retain];
    }
    [self.imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:self.discountThirdModel.photo] placeholderImage:[UIImage imageNamed:@"占位图"]];
    self.labelTitle.text = self.discountThirdModel.title;
    self.labelNum.text = self.discountThirdModel.sold;
    NSString *str = [NSString stringWithFormat:@"%@元起", self.discountThirdModel.price];
    NSString *keyOne = [NSString stringWithFormat:@"%@", self.discountThirdModel.price];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange rangeOne = [str rangeOfString:keyOne];
    NSDictionary *dic =@{NSFontAttributeName:[UIFont boldSystemFontOfSize:24],NSForegroundColorAttributeName:[UIColor redColor]};
    [attributedString setAttributes:dic range:rangeOne];
    self.labelPrice.attributedText = attributedString;

    
}

@end
