//
//  BH_R_Search_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/8/3.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_R_Search_TableViewCell.h"

@implementation BH_R_Search_TableViewCell
- (void)dealloc{
    [_leftImageView release];
    [_cnnameLabel release];
    [_ennameLabel release];
    [_numberLabel release];
    [_typeLabel release];
    [_model release];
    [super dealloc];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.leftImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_leftImageView];
        [_leftImageView release];
        
        self.cnnameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_cnnameLabel];
        [_cnnameLabel release];
        
        self.ennameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_ennameLabel];
        [_ennameLabel release];
        
        self.parentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_parentLabel];
        [_parentLabel release];
        
        self.numberLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_numberLabel];
        [_numberLabel release];
        
        self.typeLabel = [[UILabel alloc] init];
        self.typeLabel.textAlignment = 2;
        [self.contentView addSubview:_typeLabel];
        [_typeLabel release];
        
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.leftImageView.frame = CGRectMake(10 * lfweight, 10 * lfheight, WIDTH1 * 0.3, HEIGHT1 - 10 * lfheight);
//    self.leftImageView.backgroundColor = [UIColor redColor];
    
    self.cnnameLabel.frame = CGRectMake(WIDTH1 * 0.3 + 20 * lfweight, 15 * lfheight, WIDTH1 * 0.3, HEIGHT1 * 0.2);
//    self.cnnameLabel.backgroundColor = [UIColor yellowColor];
    
    self.ennameLabel.frame = CGRectMake(WIDTH1 * 0.3 + 20 * lfweight, 20 * lfheight + HEIGHT1 * 0.2, WIDTH1 * 0.3, HEIGHT1 * 0.2);
//    self.ennameLabel.backgroundColor = [UIColor magentaColor];
    
    self.numberLabel.frame = CGRectMake(WIDTH1 * 0.3 + 20 * lfweight, HEIGHT1 * 0.8, WIDTH1 * 0.5, HEIGHT1 * 0.1);
//    self.numberLabel.backgroundColor = [UIColor greenColor];
    
    self.parentLabel.frame = CGRectMake(WIDTH1 * 0.8, HEIGHT1 * 0.4, WIDTH1 * 0.2, HEIGHT1 * 0.1);
//    self.parentLabel.backgroundColor = [UIColor orangeColor];
    
    
}
- (void)setModel:(BH_R_Search_Model *)model{
    if (_model != model) {
        [_model release];
        _model = [model retain];
        [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:self.model.photo]];
        //设置富文本
        NSMutableAttributedString *cnnameString = [[NSMutableAttributedString alloc] initWithString:self.model.cnname];
        NSRange range = [self.model.cnname rangeOfString:self.string];
        [cnnameString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
        self.cnnameLabel.attributedText = cnnameString;
        self.ennameLabel.text = self.model.enname;
        
        NSMutableAttributedString *parentString = [[NSMutableAttributedString alloc] initWithString:self.model.parentname];
        NSRange praentRange = [self.model.parentname rangeOfString:self.string];
        [cnnameString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:praentRange];
        self.parentLabel.attributedText = parentString;
        
//        self.typeLabel.text = self.model.label;
        self.numberLabel.text = self.model.beenstr;
    }
}



@end
