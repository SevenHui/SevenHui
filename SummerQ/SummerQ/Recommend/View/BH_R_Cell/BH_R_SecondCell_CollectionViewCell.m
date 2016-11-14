//
//  BH_R_SecondCell_CollectionViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_SecondCell_CollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "BH_R_SecondCell_Model.h"
@implementation BH_R_SecondCell_CollectionViewCell
-(void)dealloc{
    [_bigView release];
    [_imagePhoto release];
    [_labelPriceo release];
    [_labelPriceoff release];
    [_labelTitle release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.bigView = [[UIView alloc] init];
        [self addSubview:_bigView];
        [self.bigView release];
        
        self.imagePhoto = [[UIImageView alloc] init];
        [self.bigView addSubview:_imagePhoto];
        [self.imagePhoto release];
        
        self.labelTitle = [[UILabel alloc] init];
        [self.bigView addSubview:_labelTitle];
        [self.labelTitle release];
        
        self.labelPriceoff = [[UILabel alloc] init];
        [self.bigView addSubview:_labelPriceoff];
        [self.labelPriceoff release];
        
        self.labelPriceo = [[UILabel alloc] init];
        [self.bigView addSubview:_labelPriceo];
        [self.labelPriceo release];
        
        
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bigView.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
    self.bigView.backgroundColor = [UIColor whiteColor];

    [self.bigView jxl_setDayMode:^(UIView *view) {
        //改变
        self.bigView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.bigView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    
    self.imagePhoto.frame = CGRectMake(0, 0, WIDTHVIEW, HEIGHTVIEW * 0.5);
//    self.imagePhoto.backgroundColor = COLOR;
    
    self.labelTitle.frame = CGRectMake(0, HEIGHTVIEW * 0.55, WIDTHVIEW, HEIGHTVIEW * 0.3);
    self.labelTitle.numberOfLines = 2;
//    self.labelTitle.backgroundColor = [UIColor greenColor];
    
    self.labelPriceoff.frame = CGRectMake(0, HEIGHTVIEW * 0.9, WIDTHVIEW * 0.3, HEIGHTVIEW * 0.1);
    self.labelPriceoff.textColor = [UIColor redColor];
//    self.labelPriceoff.backgroundColor = [UIColor purpleColor];
    
    self.labelPriceo.frame = CGRectMake(WIDTHVIEW * 0.5, HEIGHTVIEW * 0.9, WIDTHVIEW * 0.3, HEIGHTVIEW * 0.1);
    self.labelPriceo.textColor = [UIColor redColor];
//    self.labelPriceo.backgroundColor = [UIColor orangeColor];
    
    
    
    
}
-(void)setSecondCell_Model:(BH_R_SecondCell_Model *)secondCell_Model{
    if (_secondCell_Model != secondCell_Model) {
        [_secondCell_Model release];
        _secondCell_Model = [secondCell_Model retain];
    }
    
    [self.imagePhoto sd_setImageWithURL:[NSURL URLWithString:self.secondCell_Model.photo] placeholderImage:[UIImage imageNamed:@"占位图"]];
    
    self.labelTitle.text = self.secondCell_Model.title;
    
    self.labelPriceoff.text = self.secondCell_Model.priceoff;
    
    NSString *str = self.secondCell_Model.price;
    NSMutableString *string = [str mutableCopy];
    [string deleteCharactersInRange:NSMakeRange(0, 4)];
    self.labelPriceo.text = string;
    

}
@end
