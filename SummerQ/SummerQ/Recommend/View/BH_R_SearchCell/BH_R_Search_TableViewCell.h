//
//  BH_R_Search_TableViewCell.h
//  SummerQ
//
//  Created by apple on 16/8/3.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BH_R_Search_Model.h"
@interface BH_R_Search_TableViewCell : UITableViewCell
/**<#注释#>*/
@property (nonatomic, retain)BH_R_Search_Model *model;
/** 左侧图片 */
@property (nonatomic, retain) UIImageView *leftImageView;
/** 中文名 */
@property (nonatomic, retain) UILabel *cnnameLabel;
/** 英文名 */
@property (nonatomic, retain) UILabel *ennameLabel;
/** 去过人数 */
@property (nonatomic, retain) UILabel *numberLabel;
/** 类型 */
@property (nonatomic, retain) UILabel *typeLabel;
/** 所属地区 */
@property (nonatomic, retain) UILabel *parentLabel;
/**<#注释#>*/
@property (nonatomic, retain)NSString *string;

@end
