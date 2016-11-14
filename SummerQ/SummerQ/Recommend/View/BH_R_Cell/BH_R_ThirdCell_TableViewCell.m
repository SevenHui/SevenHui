//
//  BH_R_ThirdCell_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/14.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_ThirdCell_TableViewCell.h"
#import "UIImageView+WebCache.h"
#import "BH_R_ThirdCell_Model.h"
@implementation BH_R_ThirdCell_TableViewCell
-(void)dealloc{
    [_labelReplys release];
    [_labelViews release];
    [_labelName release];
    [_labelTitle release];
    [_imageReplys release];
    [_imageViews release];
    [_imagePhoto release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imagePhoto = [[UIImageView alloc] init];
        [self addSubview:_imagePhoto];
        [self.imagePhoto release];
        
        self.labelTitle = [[UILabel alloc] init];
        [self addSubview:_labelTitle];
        [self.labelTitle release];
        
        self.labelName = [[UILabel alloc] init];
        [self addSubview:_labelName];
        [self.labelName release];
        
        self.imageViews = [[UIImageView alloc] init];
        [self addSubview:_imageViews];
        [self.imageViews release];
        
        self.labelViews = [[UILabel alloc] init];
        [self addSubview:_labelViews];
        [self.labelViews release];
        
        self.imageReplys = [[UIImageView alloc] init];
        [self addSubview:_imageReplys];
        [self.imageReplys release];
        
        self.labelReplys = [[UILabel alloc] init];
        [self addSubview:_labelReplys];
        [self.labelReplys release];
        
        
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imagePhoto.frame = CGRectMake(10 * lfweight, 10 * lfheight, WIDTH1 * 0.3, HEIGHT1  - 20 * lfheight);
//    self.imagePhoto.backgroundColor = COLOR;
    
    self.labelTitle.frame = CGRectMake(20 * lfweight + WIDTH1 * 0.3, 10 * lfweight, WIDTH1 * 0.6, HEIGHT1 * 0.4);
    self.labelTitle.numberOfLines = 2;
//    self.labelTitle.backgroundColor = COLOR;
    
    self.labelName.frame = CGRectMake(20 * lfweight + WIDTH1 * 0.3, 20 * lfheight + HEIGHT1 * 0.4, WIDTH1 * 0.6, HEIGHT1 * 0.15);
//    self.labelName.backgroundColor = COLOR;
    
    self.imageViews.frame = CGRectMake(20 * lfweight + WIDTH1 * 0.3, 30 * lfheight + HEIGHT1 * 0.55, WIDTH1 * 0.04, HEIGHT1 * 0.1);
    self.imageViews.image = [UIImage imageNamed:@"look"];
//    self.imageViews.backgroundColor = COLOR;
    
    self.labelViews.frame = CGRectMake(30 * lfweight + WIDTH1 * 0.35, 30 * lfheight + HEIGHT1 * 0.5, WIDTH1 * 0.1, HEIGHT1 * 0.2);
//    self.labelViews.backgroundColor = COLOR;
    
    self.imageReplys.frame = CGRectMake(40 * lfweight + WIDTH1 * 0.5, 30 * lfheight + HEIGHT1 * 0.55, WIDTH1 * 0.04, HEIGHT1 * 0.1);
    self.imageReplys.image = [UIImage imageNamed:@"MapBounced"];
//    self.imageReplys.backgroundColor = COLOR;
    
    self.labelReplys.frame = CGRectMake(50 * lfweight + WIDTH1 * 0.56, 30 * lfheight + HEIGHT1 * 0.5, WIDTH1 * 0.1, HEIGHT1 * 0.2);
//    self.labelReplys.backgroundColor = COLOR;
    
    
}
-(void)setThirdCell_Model:(BH_R_ThirdCell_Model *)thirdCell_Model{
    if (_thirdCell_Model != thirdCell_Model) {
        [_thirdCell_Model release];
        _thirdCell_Model = [thirdCell_Model retain];
    }
    
    [self.imagePhoto sd_setImageWithURL:[NSURL URLWithString:self.thirdCell_Model.photo] placeholderImage:[UIImage imageNamed:@"占位图"]];
    
    self.labelTitle.text = self.thirdCell_Model.title;
    
    self.labelName.text = self.thirdCell_Model.username;
    
    self.labelViews.text = [NSString stringWithFormat:@"%ld",thirdCell_Model.views];
    
    self.labelReplys.text = self.thirdCell_Model.replys;
    
    
}





@end
