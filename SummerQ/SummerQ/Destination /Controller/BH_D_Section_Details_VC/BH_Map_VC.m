//
//  BH_Map_VC.m
//  SummerQ
//
//  Created by apple on 16/8/3.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_Map_VC.h"
#import <MAMapKit/MAMapKit.h>

@interface BH_Map_VC ()<MAMapViewDelegate>
/**<#注释#>*/
@property (nonatomic, retain)MAMapView *mapView;

@end

@implementation BH_Map_VC
-(void)dealloc{
    [_strO release];
    [_strT release];
    [_mapView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    
//    self.view.backgroundColor = [UIColor whiteColor];
    
    [MAMapServices sharedServices].apiKey = @"8c1f5199112b70600244c3834503d108";
    
    self.mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    self.mapView.delegate = self;
    
    [self.view addSubview:_mapView];
    
    self.mapView.language = MAMapLanguageZhCN;
    // 打开定位
    self.mapView.showsUserLocation = YES;
    // 地图跟看位置移动
    [self.mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    
    self.mapView.userTrackingMode = MAUserTrackingModeFollowWithHeading;
    [self.mapView setZoomLevel:16.1 animated:YES];
    // 后台定位
    self.mapView.pausesLocationUpdatesAutomatically = NO;
    self.mapView.allowsBackgroundLocationUpdates = YES;
    
    
}
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation{
    if (updatingLocation) {
        // 取出当前位置的坐标
        NSLog(@"latitude : %f, longitude : %f", userLocation.coordinate.latitude, userLocation.coordinate.longitude);
        
    }
}
-(void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views{
    MAAnnotationView *view = views[0];
    // 放到该方法中用以保证userlocation的annotationView已经添加到地图上了。
    if ([view.annotation isKindOfClass:[MAUserLocation class]])
    {
        MAUserLocationRepresentation *pre = [[MAUserLocationRepresentation alloc] init];
        pre.fillColor = [UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:0.3];
        pre.strokeColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.9 alpha:1.0];
        pre.image = [UIImage imageNamed:@"location.png"];
        pre.lineWidth = 3;
        pre.lineDashPattern = @[@6, @3];
        
        [self.mapView updateUserLocationRepresentation:pre];
        
        view.calloutOffset = CGPointMake(0, 0);
    } 

}

-(void)config{
#pragma 自定义导航返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回键"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
}
#pragma mark - 返回按钮
- (void)leftAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}







@end
















