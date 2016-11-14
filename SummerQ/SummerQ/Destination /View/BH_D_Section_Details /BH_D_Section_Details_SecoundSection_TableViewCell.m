//
//  BH_D_Section_Details_SecoundSection_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/23.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_Section_Details_SecoundSection_TableViewCell.h"
#import "BH_D_Section_Details_Discount_Model.h"
@implementation BH_D_Section_Details_SecoundSection_TableViewCell
-(void)dealloc{
    [_bigView release];
    [_labelDiscount release];
    [_imageViewPhoto release];
    [_labelPrice release];
    [_labelTitle release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // bigView
        self.bigView = [[UIView alloc] init];
        [self addSubview:_bigView];
        // 图片
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self.bigView addSubview:_imageViewPhoto];
        // 标题
        self.labelTitle = [[UILabel alloc] init];
        [self.bigView addSubview:_labelTitle];
        // 折扣
        self.labelDiscount = [[UILabel alloc] init];
        [self.bigView addSubview:_labelDiscount];
        // 起价
        self.labelPrice = [[UILabel alloc] init];
        [self.bigView addSubview:_labelPrice];
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    // bigView
    self.bigView.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
//    self.bigView.backgroundColor = [UIColor magentaColor];
    // 图片
    self.imageViewPhoto.frame = CGRectMake(10 * lfweight, 10 * lfweight, WIDTHVIEW * 0.35, HEIGHTVIEW - 20 * lfheight);
//    self.imageViewPhoto.backgroundColor = COLOR;
    // 标题
    self.labelTitle.frame = CGRectMake(20 * lfweight + WIDTHVIEW * 0.35, 12 * lfheight, WIDTHVIEW - (20 * lfweight + WIDTHVIEW * 0.35), HEIGHTVIEW * 0.4);
    self.labelTitle.numberOfLines = 2;
//    self.labelTitle.backgroundColor = [UIColor purpleColor];
    // 折扣
    self.labelDiscount.frame = CGRectMake(20 * lfweight + WIDTHVIEW * 0.35, HEIGHTVIEW - (HEIGHTVIEW * 0.3), WIDTHVIEW * 0.2, HEIGHTVIEW * 0.2);
    self.labelDiscount.textColor = [UIColor redColor];
//    self.labelDiscount.backgroundColor = [UIColor greenColor];
    // 起价
    self.labelPrice.frame = CGRectMake(WIDTHVIEW - (WIDTHVIEW * 0.25), HEIGHTVIEW - (HEIGHTVIEW * 0.3), WIDTHVIEW * 0.2, HEIGHTVIEW * 0.2);
    self.labelPrice.textColor = [UIColor redColor];
//    self.labelPrice.backgroundColor = [UIColor blueColor];
    

    
}
-(void)setDiscountModel:(BH_D_Section_Details_Discount_Model *)discountModel{
    if (_discountModel != discountModel) {
        [_discountModel release];
        _discountModel = [discountModel retain];
    }
    
    [self.imageViewPhoto sd_setImageWithURL:[NSURL URLWithString:self.discountModel.photo] placeholderImage:[UIImage imageNamed:@"占位图"]];
    self.labelTitle.text = self.discountModel.title;
    self.labelDiscount.text = self.discountModel.priceoff;
    
}

@end
