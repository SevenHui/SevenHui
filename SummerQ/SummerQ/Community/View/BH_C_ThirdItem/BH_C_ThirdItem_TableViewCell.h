//
//  BH_C_ThirdItem_TableViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_C_ThirdItem_Model;

@interface BH_C_ThirdItem_TableViewCell : UITableViewCell
/**模型数组*/
@property (nonatomic, retain)BH_C_ThirdItem_Model *thirdItemModel;
/**view*/
@property (nonatomic, retain)UIView *bigView;
/**时间图标*/
@property (nonatomic, retain)UIImageView *imageViewTime;
/**开始时间*/
@property (nonatomic, retain)UILabel *labelStartTime;
/**至*/
@property (nonatomic, retain)UIView *lineView;
/**结束时间*/
@property (nonatomic, retain)UILabel *labelStopTime;
/**地址图标*/
@property (nonatomic, retain)UIImageView *imageViewAdd;
/**地址*/
@property (nonatomic, retain)UILabel *labelAdd;
/**标题*/
@property (nonatomic, retain)UILabel *labelTitle;
/**昵称*/
@property (nonatomic, retain)UILabel *labelUserName;


@end
