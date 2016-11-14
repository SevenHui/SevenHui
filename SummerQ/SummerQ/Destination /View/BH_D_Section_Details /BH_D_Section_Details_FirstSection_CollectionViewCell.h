//
//  BH_D_Section_Details_FirstSection_CollectionViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/25.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BH_D_Section_Details_FirstSection_CollectionViewCell : UICollectionViewCell
/**bigView*/
@property (nonatomic, retain)UIView *bigView;
/**图片*/
@property (nonatomic, retain)UIImageView *imageViewPhoto;
/**中文名字*/
@property (nonatomic, retain)UILabel *labelCnname;
/**英文名字*/
@property (nonatomic, retain)UILabel *labelEnname;

@end
