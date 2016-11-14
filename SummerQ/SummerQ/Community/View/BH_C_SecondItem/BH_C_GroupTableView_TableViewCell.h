//
//  BH_C_GroupTableView_TableViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_C_SecondItem_Group_Model;

@interface BH_C_GroupTableView_TableViewCell : UITableViewCell
/**组模型数组*/
@property (nonatomic, retain)BH_C_SecondItem_Group_Model *groupCellModel;
/**头像*/
@property (nonatomic, retain)UIImageView *imageViewPhoto;
/**名字*/
@property (nonatomic, retain)UILabel *labelName;
/**描述*/
@property (nonatomic, retain)UILabel *labelDescription;

@end
