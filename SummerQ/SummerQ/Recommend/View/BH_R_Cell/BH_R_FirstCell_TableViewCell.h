//
//  BH_R_FirstCell_TableViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/14.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_R_AllFirstCell_VC;
@interface BH_R_FirstCell_TableViewCell : UITableViewCell

@property (nonatomic, copy)void(^block)(BH_R_AllFirstCell_VC *);

/**<#注释#>*/
@property (nonatomic, retain)UIView *bigView;
/**<#注释#>*/
@property (nonatomic, retain)UIButton *btnOne;
/**<#注释#>*/
@property (nonatomic, retain)UIButton *btnTwo;
/**<#注释#>*/
@property (nonatomic, retain)UIButton *btnThree;
/**<#注释#>*/
@property (nonatomic, retain)UIButton *btnFour;
/**set方法*/
@property (nonatomic, retain)NSMutableArray *arr;
/**url*/
@property (nonatomic, retain)NSMutableArray *array;


@end
