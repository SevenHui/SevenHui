//
//  BH_C_TwoBigPic_TableViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_C_FirstItem_Model;

@interface BH_C_TwoBigPic_TableViewCell : UITableViewCell
/**模型数组*/
@property (nonatomic, retain)BH_C_FirstItem_Model *firstItemModel;

/**backView*/
@property (nonatomic, retain)UIView *backView;
/**头像*/
@property (nonatomic, retain)UIImageView *imageViewAvatar;
/**昵称*/
@property (nonatomic, retain)UILabel *labelAuthor;
/**标题*/
@property (nonatomic, retain)UILabel *labelTitle;
/**地点*/
@property (nonatomic, retain)UILabel *labelForum;
/**时间*/
@property (nonatomic, retain)UILabel *labelTime;
/**图片One*/
@property (nonatomic, retain)UIImageView *imageViewphotoOne;
/**图片Two*/
@property (nonatomic, retain)UIImageView *imageViewPhotoTwo;


@end
