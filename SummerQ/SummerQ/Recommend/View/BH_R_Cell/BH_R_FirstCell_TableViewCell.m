//
//  BH_R_FirstCell_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/14.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_FirstCell_TableViewCell.h"
#import "UIButton+WebCache.h"
#import "BH_R_AllFirstCell_VC.h"

@implementation BH_R_FirstCell_TableViewCell
-(void)dealloc{
    [_bigView release];
    [_btnOne release];
    [_btnTwo release];
    [_btnThree release];
    [_btnFour release];
    [_arr release];
    [_array release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.bigView = [[UIView alloc] init];
        [self addSubview:_bigView];
        [self.bigView release];
        // 上
        self.btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bigView addSubview:_btnOne];
        // 左
        self.btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bigView addSubview:_btnTwo];
        // 右
        self.btnThree = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bigView addSubview:_btnThree];
        // 查看全部
        self.btnFour = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bigView addSubview:_btnFour];
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bigView.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
    self.bigView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];

    [self.bigView jxl_setDayMode:^(UIView *view) {
        //改变
        self.bigView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    } nightMode:^(UIView *view) {
        //改变
        self.bigView.backgroundColor = [UIColor colorWithRed:0.66 green:0.66 blue:0.66 alpha:1.00];
    }];

    
    // 上
    self.btnOne.frame = CGRectMake(0, 0, self.bigView.frame.size.width, self.bigView.frame.size.height * 0.4);
//    self.btnOne.backgroundColor = COLOR;
    [self.btnOne addTarget:self action:@selector(btnOneAction:) forControlEvents:UIControlEventTouchUpInside];
    
    // 左
    self.btnTwo.frame = CGRectMake(10 * lfweight, self.bigView.frame.size.width * 0.39, self.bigView.frame.size.width * 0.46, self.bigView.frame.size.width * 0.3);
    [self.btnTwo addTarget:self action:@selector(btnTwoAction:) forControlEvents:UIControlEventTouchUpInside];
//    self.btnTwo.backgroundColor = COLOR;
    // 右
    self.btnThree.frame = CGRectMake(5 * lfweight + self.bigView.frame.size.width * 0.5, self.bigView.frame.size.width * 0.39, self.bigView.frame.size.width * 0.46, self.bigView.frame.size.width * 0.3);
    [self.btnThree addTarget:self action:@selector(btnThreeAction:) forControlEvents:UIControlEventTouchUpInside];
//    self.btnThree.backgroundColor = COLOR;
    // 查看全部
    self.btnFour.frame = CGRectMake(0, self.bigView.frame.size.width * 0.72, self.bigView.frame.size.width, 50 * lfheight);
    self.btnFour.backgroundColor = [UIColor whiteColor];
    [self.btnFour setTitle:@"查看全部" forState:UIControlStateNormal];
    [self.btnFour setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [self.btnFour addTarget:self action:@selector(btnFourAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.btnFour jxl_setDayMode:^(UIView *view) {
        //改变
        self.btnFour.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.btnFour.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    
}
#pragma mark - 上 跳转
-(void)btnOneAction:(UIButton *)btnOne{
    BH_WKWebView_VC *vc = [[BH_WKWebView_VC alloc] init];
    vc.strURL = self.array[0];
    [[self naviController] pushViewController:vc animated:YES];

}
#pragma mark - 左 跳转
-(void)btnTwoAction:(UIButton *)btnTwo{
    BH_WKWebView_VC *vc = [[BH_WKWebView_VC alloc] init];
    vc.strURL = self.array[1];
    [[self naviController] pushViewController:vc animated:YES];

}
#pragma mark - 右 跳转
-(void)btnThreeAction:(UIButton *)btn{
    BH_WKWebView_VC *vc = [[BH_WKWebView_VC alloc] init];
    vc.strURL = self.array[2];
    [[self naviController] pushViewController:vc animated:YES];

}
#pragma mark - 查看全部 跳转
-(void)btnFourAction:(UIButton *)btnFour{

    BH_R_AllFirstCell_VC *allFirstCellVC = [[BH_R_AllFirstCell_VC alloc]init];
    self.block(allFirstCellVC);
    
}
#pragma mark - 重写set方法
-(void)setArr:(NSMutableArray *)arr{
    if (_arr !=arr) {
        [_arr release];
        _arr = [arr retain];
    }
    [self.btnOne sd_setBackgroundImageWithURL:[NSURL URLWithString:arr[0]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"占位图"]];
    [self.btnTwo sd_setBackgroundImageWithURL:[NSURL URLWithString:arr[1]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"占位图"]];
    [self.btnThree sd_setBackgroundImageWithURL:[NSURL URLWithString:arr[2]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"占位图"]];
    
}
#pragma mark - 当前控制器的导航控制器
- (UINavigationController*)naviController {
    
    for (UIView *next = [self superview]; next; next = next.superview) {
        
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            
            return (UINavigationController*)nextResponder;
        }
    }
    return nil;
}




@end
