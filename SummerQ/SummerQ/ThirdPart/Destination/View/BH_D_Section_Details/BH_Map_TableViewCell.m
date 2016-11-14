//
//  BH_Map_TableViewCell.m
//  SummerQ
//
//  Created by apple on 16/8/3.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_Map_TableViewCell.h"

@implementation BH_Map_TableViewCell
-(void)dealloc{
    [_imageViewPoto release];
    [super dealloc];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageViewPoto = [[UIImageView alloc] init];
        [self addSubview:_imageViewPoto];
        
    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageViewPoto.frame = CGRectMake(0, 0, WIDTH1, HEIGHT1);
    self.imageViewPoto.image = [UIImage imageNamed:@"map-1"];
    
}

@end
