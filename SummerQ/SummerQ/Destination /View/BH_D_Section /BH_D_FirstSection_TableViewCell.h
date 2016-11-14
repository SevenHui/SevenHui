//
//  BH_D_FirstSection_TableViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_D_Section_Details_VC;

@interface BH_D_FirstSection_TableViewCell : UITableViewCell
/**<#注释#>*/
@property (nonatomic, retain)NSMutableArray *array;

@property (nonatomic, copy)void(^block)(BH_D_Section_Details_VC *);

@end
