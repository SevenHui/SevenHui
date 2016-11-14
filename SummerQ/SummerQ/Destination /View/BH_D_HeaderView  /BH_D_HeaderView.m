//
//  BH_D_HeaderView.m
//  SummerQ
//
//  Created by apple on 16/7/16.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_D_HeaderView.h"

@interface BH_D_HeaderView ()
/**头视图图片*/
@property (nonatomic, retain)UIImageView *imageViewHeader;

@end

@implementation BH_D_HeaderView
-(void)dealloc{
    [_imageViewHeader release];
    [_btnAsia release];
    [_btnOceania release];
    [_btnAntarctica release];
    [_btnAfrica release];
    [_btnEurope release];
    [_btnSouthAmerica release];
    [_btnNorthAmerica release];
    [super dealloc];
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 头视图图片
        self.imageViewHeader = [[UIImageView alloc] init];
        [self addSubview:_imageViewHeader];
        [self.imageViewHeader release];
        // 亚洲
        self.btnAsia = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_btnAsia];
        // 大洋洲
        self.btnOceania = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_btnOceania];
        // 南极洲
        self.btnAntarctica = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_btnAntarctica];
        // 非洲
        self.btnAfrica = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_btnAfrica];
        // 欧洲
        self.btnEurope = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_btnEurope];
        // 南美洲
        self.btnSouthAmerica = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_btnSouthAmerica];
        // 北美洲
        self.btnNorthAmerica = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_btnNorthAmerica];
        
        
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageViewHeader.frame = CGRectMake(0, 0, WIDTHSCREEN, 270 * lfheight);
   self.imageViewHeader.image = [UIImage imageNamed:@"ditu"];
//    self.imageViewHeader.backgroundColor = [UIColor purpleColor];

    
    self.btnAsia.frame = CGRectMake(WIDTH1 * 0.71, HEIGHT1 * 0.14, WIDTH1 * 0.15, HEIGHT1 * 0.16);
    [self.btnAsia setTitle:@"亚洲" forState:UIControlStateNormal];
    [self.btnAsia setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.btnAsia.layer.cornerRadius = 4;
    self.btnAsia.backgroundColor = [UIColor whiteColor];
    [self.btnAsia addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnOceania.frame = CGRectMake(WIDTH1 * 0.75, HEIGHT1 * 0.45, WIDTH1 * 0.16, HEIGHT1 * 0.16);
    [self.btnOceania setTitle:@"大洋洲" forState:UIControlStateNormal];
    [self.btnOceania setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.btnOceania.layer.cornerRadius = 4;
    self.btnOceania.backgroundColor = [UIColor whiteColor];
    [self.btnOceania addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    self.btnAntarctica.frame = CGRectMake(WIDTH1 * 0.6, HEIGHT1 * 0.67, WIDTH1 * 0.17, HEIGHT1 * 0.16);
    [self.btnAntarctica setTitle:@"南极洲" forState:UIControlStateNormal];
    [self.btnAntarctica setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.btnAntarctica.layer.cornerRadius = 4;
    self.btnAntarctica.backgroundColor = [UIColor whiteColor];
    [self.btnAntarctica addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    self.btnAfrica.frame = CGRectMake(WIDTH1 * 0.48, HEIGHT1 * 0.42, WIDTH1 * 0.13, HEIGHT1 * 0.16);
    [self.btnAfrica setTitle:@"非洲" forState:UIControlStateNormal];
    [self.btnAfrica setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.btnAfrica.layer.cornerRadius = 4;
    self.btnAfrica.backgroundColor = [UIColor whiteColor];
    [self.btnAfrica addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    self.btnEurope.frame = CGRectMake(WIDTH1 * 0.37, HEIGHT1 * 0.09, WIDTH1 * 0.13, HEIGHT1 * 0.16);
    [self.btnEurope setTitle:@"欧洲" forState:UIControlStateNormal];
    [self.btnEurope setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.btnEurope.layer.cornerRadius = 4;
    self.btnEurope.backgroundColor = [UIColor whiteColor];
    [self.btnEurope addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    self.btnSouthAmerica.frame = CGRectMake(WIDTH1 * 0.22, HEIGHT1 * 0.48, WIDTH1 * 0.17, HEIGHT1 * 0.16);
    [self.btnSouthAmerica setTitle:@"南美洲" forState:UIControlStateNormal];
    [self.btnSouthAmerica setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.btnSouthAmerica.layer.cornerRadius = 4;
    self.btnSouthAmerica.backgroundColor = [UIColor whiteColor];
    [self.btnSouthAmerica addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    self.btnNorthAmerica.frame = CGRectMake(WIDTH1 * 0.07,HEIGHT1 * 0.11, WIDTH1 * 0.17, HEIGHT1 * 0.16);
    [self.btnNorthAmerica setTitle:@"北美洲" forState:UIControlStateNormal];
    [self.btnNorthAmerica setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.btnNorthAmerica.layer.cornerRadius = 4;
    self.btnNorthAmerica.backgroundColor = [UIColor whiteColor];
    [self.btnNorthAmerica addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)btnAction:(UIButton *)btn{
    
    NSString *title = btn.titleLabel.text;
    [self.delegate title:title];
}

@end
