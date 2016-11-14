//
//  BH_D_FirstSection_CollectionViewCell.h
//  SummerQ
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BH_D_FirstSection_CollectionViewCell : UICollectionViewCell
/**大View*/
@property (nonatomic, retain)UIView *bigView;
/**图片*/
@property (nonatomic, retain)UIImageView *imageViewPhoto;
/**国家中文*/
@property (nonatomic, retain)UILabel *labelCnname;
/**国家英文*/
@property (nonatomic, retain)UILabel *labelEnname;
/**小View*/
@property (nonatomic, retain)UIView *smailView;
/**数量*/
@property (nonatomic, retain)UILabel *labelCount;
/**城市*/
@property (nonatomic, retain)UILabel *labelLabel;
/**毛玻璃*/
@property (nonatomic, retain)UIVisualEffectView *effectView;

+ (CGFloat)getImageHeightWithImageName:(NSString *)imageName;

@end
