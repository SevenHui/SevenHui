//
//  BH_R_ThirdCell_TableViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/14.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_R_ThirdCell_Model;

@interface BH_R_ThirdCell_TableViewCell : UITableViewCell
/**BH_R_ThirdCell_Model*/
@property (nonatomic, retain)BH_R_ThirdCell_Model *thirdCell_Model;

/**图片*/
@property (nonatomic, retain)UIImageView *imagePhoto;
/**标题*/
@property (nonatomic, retain)UILabel *labelTitle;
/**昵称*/
@property (nonatomic, retain)UILabel *labelName;
/**图标查看*/
@property (nonatomic, retain)UIImageView *imageViews;
/**查看*/
@property (nonatomic, retain)UILabel *labelViews;
/**图标评论*/
@property (nonatomic, retain)UIImageView *imageReplys;
/**评论*/
@property (nonatomic, retain)UILabel *labelReplys;


@end
