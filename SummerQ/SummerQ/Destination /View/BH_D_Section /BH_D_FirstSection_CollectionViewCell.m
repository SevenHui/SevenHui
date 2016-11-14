//
//  BH_D_FirstSection_CollectionViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_FirstSection_CollectionViewCell.h"

@implementation BH_D_FirstSection_CollectionViewCell
-(void)dealloc{
    [_bigView release];
    [_imageViewPhoto release];
    [_labelCnname release];
    [_labelEnname release];
    [_smailView release];
    [_labelCount release];
    [_labelLabel release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 大View
        self.bigView = [[UIView alloc] init];
        [self addSubview:_bigView];
        [self.bigView release];
        // 图片
        self.imageViewPhoto = [[UIImageView alloc] init];
        [self.bigView addSubview:_imageViewPhoto];
        [self.imageViewPhoto release];
        // 毛玻璃
//        self.effectView = [[UIVisualEffectView alloc] init];
//        [self.imageViewPhoto addSubview:_effectView];
//        [self.effectView release];
        // 国家中文
        self.labelCnname = [[UILabel alloc] init];
        [self.imageViewPhoto addSubview:_labelCnname];
        [self.labelCnname release];
        // 国家英文
        self.labelEnname = [[UILabel alloc] init];
        [self.imageViewPhoto addSubview:_labelEnname];
        [self.labelEnname release];
        // 小View
        self.smailView = [[UIView alloc] init];
        [self.imageViewPhoto addSubview:_smailView];
        [self.smailView release];
        // 数量
        self.labelCount = [[UILabel alloc] init];
        [self.smailView addSubview:_labelCount];
        [self.labelCount release];
        // 城市
        self.labelLabel = [[UILabel alloc] init];
        [self.smailView addSubview:_labelLabel];
        [self.labelLabel release];
        
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bigView.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
//    self.bigView.backgroundColor = COLOR;

    [self.bigView jxl_setDayMode:^(UIView *view) {
        //改变
        self.bigView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        self.bigView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    
    self.imageViewPhoto.frame = CGRectMake(0, 0, WIDTHVIEW, HEIGHTVIEW);
//    self.imageViewPhoto.backgroundColor = COLOR;
    self.imageViewPhoto.clipsToBounds = YES;
    [self.imageViewPhoto.layer setCornerRadius:7];
    self.imageViewPhoto.layer.shouldRasterize = YES;

    self.labelCnname.frame = CGRectMake(0, HEIGHTVIEW * 0.75 * lfheight, WIDTHVIEW, HEIGHTVIEW * 0.12 * lfheight);
    self.labelCnname.textColor = [UIColor whiteColor];
    self.labelCnname.textAlignment = 1;
    self.labelCnname.font = [UIFont fontWithName:@"Verdana-Bold" size:20 * lfweight];
//    self.labelCnname.backgroundColor = [UIColor orangeColor];
    
    self.labelEnname.frame = CGRectMake(0, HEIGHTVIEW * 0.87 * lfheight, WIDTHVIEW, HEIGHTVIEW * 0.13 * lfheight);
    self.labelEnname.textColor = [UIColor whiteColor];
    self.labelEnname.textAlignment = 1;
    self.labelEnname.font = [UIFont fontWithName:@"Verdana-Bold" size:20 *lfweight];
//    self.labelEnname.backgroundColor = [UIColor blueColor];
    
    self.smailView.frame = CGRectMake(self.imageViewPhoto.frame.size.width * 0.55 * lfweight, 20 * lfheight, 65 * lfweight, 60 * lfheight);
    self.smailView.layer.cornerRadius = 2;
    self.smailView.backgroundColor = [UIColor colorWithRed:0.27 green:0.34 blue:0.36 alpha:1.00];
    self.smailView.alpha = 0.5;
    
    self.labelCount.frame = CGRectMake(0, 0, self.smailView.frame.size.width, self.smailView.frame.size.height * 0.6 * lfheight);
    self.labelCount.textColor = [UIColor whiteColor];
    self.labelCount.textAlignment = 1;
    self.labelCount.font = [UIFont fontWithName:@"Verdana-Bold" size:20 * lfweight];
//    self.labelCount.backgroundColor = [UIColor whiteColor];
    
    self.labelLabel.frame = CGRectMake(0, self.smailView.frame.size.height * 0.6 * lfheight, self.smailView.frame.size.width, self.smailView.frame.size.height * 0.4 * lfheight);
    self.labelLabel.textColor = [UIColor whiteColor];
    self.labelLabel.textAlignment = 1;
    self.labelLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:17 * lfweight];
//    self.labelLabel.backgroundColor = [UIColor purpleColor];
    
    
}

+ (CGFloat)getImageHeightWithImageName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return image.size.height / image.size.width * WIDTHSCREEN;
}


@end
