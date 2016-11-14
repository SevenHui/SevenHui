//
//  BH_C_ThirdItem_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_C_ThirdItem_TableViewCell.h"
#import "BH_C_ThirdItem_Model.h"
@implementation BH_C_ThirdItem_TableViewCell
-(void)dealloc{
    [_bigView release];
    [_imageViewTime release];
    [_labelStartTime release];
    [_lineView release];
    [_labelStopTime release];
    [_imageViewAdd release];
    [_labelAdd release];
    [_labelTitle release];
    [_labelUserName release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.bigView = [[UIView alloc] init];
        [self addSubview:_bigView];
        [self.bigView release];
        // 时间图标
        self.imageViewTime = [[UIImageView alloc] init];
        [self.bigView addSubview:_imageViewTime];
        [self.imageViewTime release];
        // 开始时间
        self.labelStartTime = [[UILabel alloc] init];
        [self.bigView addSubview:_labelStartTime];
        [self.labelStartTime release];
        // 至
        self.lineView = [[UIView alloc] init];
        [self.bigView addSubview:_lineView];
        [self.lineView release];
        // 结束时间
        self.labelStopTime = [[UILabel alloc] init];
        [self.bigView addSubview:_labelStopTime];
        [self.labelStopTime release];
        // 地址图标
        self.imageViewAdd = [[UIImageView alloc] init];
        [self.bigView addSubview:_imageViewAdd];
        [self.imageViewAdd release];
        // 地址
        self.labelAdd = [[UILabel alloc] init];
        [self.bigView addSubview:_labelAdd];
        [self.labelAdd release];
        // 标题
        self.labelTitle = [[UILabel alloc] init];
        [self.bigView addSubview: _labelTitle];
        [self.labelTitle release];
        // 昵称
        self.labelUserName = [[UILabel alloc] init];
        [self.bigView addSubview:_labelUserName];
        [self.labelUserName release];

        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bigView.frame = CGRectMake(0, 20 * lfheight, WIDTH1, HEIGHT1 - 20 * lfheight);
    self.bigView.backgroundColor = [UIColor whiteColor];

    [self.bigView jxl_setDayMode:^(UIView *view) {
        //改变
        self.bigView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.bigView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    // 时间图标
    self.imageViewTime.frame = CGRectMake(10 * lfweight, HEIGHTVIEW * 0.18, 20 * lfweight, 20 * lfheight);
    self.imageViewTime.image = [UIImage imageNamed:@"calendar"];
    [self.bigView addSubview:_imageViewTime];
    // 开始时间
    self.labelStartTime.frame = CGRectMake(40 * lfweight, HEIGHTVIEW * 0.2, WIDTHVIEW * 0.3, HEIGHTVIEW * 0.1);
//    self.labelStartTime.backgroundColor = [UIColor yellowColor];
    // 至
    self.lineView.frame = CGRectMake(40 * lfweight + WIDTHVIEW * 0.27, HEIGHTVIEW * 0.2 + HEIGHTVIEW * 0.04, 8 * lfweight, HEIGHTVIEW * 0.01);
    self.lineView.backgroundColor = [UIColor blackColor];
    // 结束时间
    self.labelStopTime.frame = CGRectMake(40 * lfweight + WIDTHVIEW * 0.3, HEIGHTVIEW * 0.2, WIDTHVIEW * 0.3, HEIGHTVIEW * 0.1);
//    self.labelStopTime.backgroundColor = [UIColor orangeColor];
    // 地址图标
    self.imageViewAdd.frame = CGRectMake(40 * lfweight + WIDTHVIEW * 0.65, HEIGHTVIEW * 0.18, 20 * lfweight, 20 * lfheight);
    self.imageViewAdd.image = [UIImage imageNamed:@"location"];
//    self.imageViewAdd.backgroundColor = [UIColor yellowColor];
    // 地址
    self.labelAdd.frame = CGRectMake(40 * lfweight + WIDTHVIEW * 0.65 + 20 * lfweight, HEIGHTVIEW * 0.2, WIDTHVIEW * 0.4, HEIGHTVIEW * 0.08);
//    self.labelAdd.backgroundColor = [UIColor yellowColor];
    // 标题
    self.labelTitle.frame = CGRectMake(10 * lfweight, HEIGHTVIEW * 0.4, WIDTHVIEW, HEIGHTVIEW * 0.2);
//    self.labelTitle.backgroundColor = [UIColor yellowColor];
    // 昵称
    self.labelUserName.frame = CGRectMake(10 * lfweight, HEIGHTVIEW * 0.7 , WIDTHVIEW - 20 * lfweight, HEIGHTVIEW * 0.2);
    
    
}
-(void)setThirdItemModel:(BH_C_ThirdItem_Model *)thirdItemModel{
    if (_thirdItemModel != thirdItemModel) {
        [_thirdItemModel release];
        _thirdItemModel = [thirdItemModel retain];
    }
    NSDate *date = [NSDate date];
    NSString *nowTime = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    NSInteger passTime = [nowTime integerValue] - [self.thirdItemModel.publish_time integerValue];
    
    NSDateFormatter *formatter = [[[NSDateFormatter alloc]init]autorelease];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY.MM.dd"];
    NSDate *dateOfStar = [NSDate dateWithTimeIntervalSince1970:[self.thirdItemModel.start_time integerValue]];
    NSString *dateofStarStr = [formatter stringFromDate:dateOfStar];
    NSDate *dateOfEnd = [NSDate dateWithTimeIntervalSince1970:[self.thirdItemModel.end_time integerValue]];
    NSString *dateofEndStr = [formatter stringFromDate:dateOfEnd];
 
    self.labelStartTime.text = dateofStarStr;
    self.labelStopTime.text = dateofEndStr;
    
    self.labelAdd.text = self.thirdItemModel.citys_str;
    self.labelTitle.text = self.thirdItemModel.title;
    
    NSInteger fen = passTime / 60;
    NSString *fenStr = [NSString stringWithFormat:@"%ld", (long)fen];
    NSString *stt = self.thirdItemModel.username;
    NSString *str= [NSString stringWithFormat:@"%@ | %@分钟前",stt, fenStr];
    self.labelUserName.text = str;

    
    
}

@end
