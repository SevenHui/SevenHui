//
//  BH_R_LookPack_CollectionViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_R_LookPackGuides_Model;

@interface BH_R_LookPack_CollectionViewCell : UICollectionViewCell
/**锦囊模型*/
@property (nonatomic, retain)BH_R_LookPackGuides_Model *lookPackGuidesModel;
/**背景view*/
@property (nonatomic, retain)UIView *bigView;
/**名字*/
@property (nonatomic, retain)UIView *viewName;
/**图片*/
@property (nonatomic, retain)UIImageView *imageViewPhoto;

@end
