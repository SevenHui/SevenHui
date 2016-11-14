//
//  BH_D_HeaderView.h
//  SummerQ
//
//  Created by apple on 16/7/16.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BHBaseView.h"


@protocol BH_D_HeaderViewDelegate <NSObject>

- (void)title:(NSString *)str;

@end


@interface BH_D_HeaderView : BHBaseView
/**亚洲*/
@property (nonatomic, retain)UIButton *btnAsia;
/**大洋洲*/
@property (nonatomic, retain)UIButton *btnOceania;
/**南极洲*/
@property (nonatomic, retain)UIButton *btnAntarctica;
/**非洲*/
@property (nonatomic, retain)UIButton *btnAfrica;
/**欧洲*/
@property (nonatomic, retain)UIButton *btnEurope;
/**南美洲*/
@property (nonatomic, retain)UIButton *btnSouthAmerica;
/**北美洲*/
@property (nonatomic, retain)UIButton *btnNorthAmerica;

/**代理人*/ // assign 防止循环引用
@property (nonatomic, assign)id<BH_D_HeaderViewDelegate> delegate;

@end
