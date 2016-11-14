//
//  BH_C_OneBigPic_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_C_OneBigPic_TableViewCell.h"
#import "BH_C_FirstItem_Model.h"
@implementation BH_C_OneBigPic_TableViewCell
-(void)dealloc{
    [_imageViewphoto release];
    [_firstItemModel release];
    [_labelTitle release];
    [_labelTime release];
    [_labelForum release];
    [_labelAuthor release];
    [_imageViewAvatar release];
    [_backView release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 背景view
        self.backView = [[UIView alloc] init];
        [self addSubview:_backView];
        [self.backView release];
        // 头像
        self.imageViewAvatar = [[UIImageView alloc] init];
        [self.backView addSubview:_imageViewAvatar];
        [self.imageViewAvatar release];
        // 昵称
        self.labelAuthor = [[UILabel alloc] init];
        [self.backView addSubview:_labelAuthor];
        [self.labelAuthor release];
        // 标题
        self.labelTitle = [[UILabel alloc] init];
        [self.backView addSubview:_labelTitle];
        [self.labelTitle release];
        // 地点
        self.labelForum = [[UILabel alloc] init];
        [self.backView addSubview:_labelForum];
        [self.labelForum release];
        // 时间
        self.labelTime = [[UILabel alloc] init];
        [self.backView addSubview:_labelTime];
        [self.labelTime release];
        // 图片
        self.imageViewphoto = [[UIImageView alloc] init];
        [self.backView addSubview:_imageViewphoto];
        [self.imageViewphoto release];
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.backView.frame = CGRectMake(0, 20 * lfheight, WIDTH1, HEIGHT1 - 20 * lfheight);
    self.backView.backgroundColor = [UIColor whiteColor];

    [self.backView jxl_setDayMode:^(UIView *view) {
        //改变
        self.backView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.backView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    // 头像
    self.imageViewAvatar.frame = CGRectMake(10 * lfweight, 8 * lfheight, 40 * lfweight, 40 * lfheight);
    self.imageViewAvatar.layer.cornerRadius = 20;
    //    self.imageView.backgroundColor = COLOR;
    // 昵称
    self.labelAuthor.frame = CGRectMake(WIDTHBACK * 0.15, 10 * lfheight, WIDTHBACK, HEIGHTBACK * 0.1);
    self.labelAuthor.textColor = [UIColor grayColor];
    //    self.labelAuthor.backgroundColor = COLOR;
    // 标题
    self.labelTitle.frame = CGRectMake(WIDTHBACK * 0.15, HEIGHTBACK * 0.1, WIDTHBACK - (WIDTHBACK * 0.15), HEIGHTBACK * 0.3);
    self.labelTitle.numberOfLines = 2;
    //    self.labelTitle.backgroundColor = [UIColor orangeColor];
    // 地点
    self.labelForum.frame = CGRectMake(WIDTHBACK * 0.15, HEIGHTBACK * 0.8, WIDTHBACK * 0.45, HEIGHTBACK * 0.1);
    self.labelForum.textColor = [UIColor greenColor];
    // 时间
    self.labelTime.frame = CGRectMake(WIDTHBACK * 0.7, HEIGHTBACK * 0.8, WIDTHBACK * 0.4, HEIGHTBACK * 0.1);
    //    self.labelTime.backgroundColor = [UIColor orangeColor];
    // 图片
    self.imageViewphoto.frame = CGRectMake(WIDTHBACK * 0.15, HEIGHTBACK * 0.4, WIDTHBACK * 0.25, HEIGHTBACK * 0.3);
//    self.imageViewphoto.backgroundColor = COLOR;
    
    
}
-(void)setFirstItemModel:(BH_C_FirstItem_Model *)firstItemModel{
    if (_firstItemModel != firstItemModel) {
        [_firstItemModel release];
        _firstItemModel = [firstItemModel retain];
    }
    
    // 头像
    [self.imageViewAvatar sd_setImageWithURL:[NSURL URLWithString:self.firstItemModel.avatar] placeholderImage:nil];
    // 昵称
    self.labelAuthor.text = self.firstItemModel.author;
    // 标题
    self.labelTitle.text = self.firstItemModel.title;
    // 地点
    self.labelForum.text = self.firstItemModel.forum;
    // 时间
    self.labelTime.text = self.firstItemModel.reply_time;
    // 图片
    [self.imageViewphoto sd_setImageWithURL:[NSURL URLWithString:self.firstItemModel.bigpic_arr[0]] placeholderImage:[UIImage imageNamed:@"占位图"]];
    
}


@end
