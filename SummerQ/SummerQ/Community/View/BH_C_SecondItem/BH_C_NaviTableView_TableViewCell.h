//
//  BH_C_NaviTableView_TableViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_C_SecondItem_Model;

@interface BH_C_NaviTableView_TableViewCell : UITableViewCell
/**导航模型数组*/
@property (nonatomic, retain)BH_C_SecondItem_Model *naviCellModel;

/**名字*/
@property (nonatomic, retain)UILabel *labelName;


@end
