//
//  BH_R_SecondCell_CollectionViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BH_R_SecondCell_Model;

@interface BH_R_SecondCell_CollectionViewCell : UICollectionViewCell
/**BH_R_SecondCell_Model*/
@property (nonatomic, retain)BH_R_SecondCell_Model *secondCell_Model;
/**bigView*/
@property (nonatomic, retain)UIView *bigView;
/**照片*/
@property (nonatomic, retain)UIImageView *imagePhoto;
/**标题*/
@property (nonatomic, retain)UILabel *labelTitle;
/**折价*/
@property (nonatomic, retain)UILabel *labelPriceoff;
/**价格*/
@property (nonatomic, retain)UILabel *labelPriceo;


@end
