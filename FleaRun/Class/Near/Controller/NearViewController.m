//
//  NearViewController.m
//  FleaRun
//
//  Created by 李志强 on 16/7/11.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import "NearViewController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件


@interface NearViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
    BMKMapManager* _mapManager;//创建百度地图管理器

    BMKLocationService *_locService;

}
@end

@implementation NearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建百度地图管理器
    [self createMapManager];
    //创建百度地图
    [self createMapView];
    
    
    //定位功能
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    
}

//创建百度地图管理器
-(void)createMapManager{

    _mapManager = [[BMKMapManager alloc]init];
   
    BOOL ret = [_mapManager start:@"Ps5bZxQ6jGlOzsDssGWfsWfyMml2kmGV"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
}
//创建百度地图
-(void)createMapView{
    
    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H)];

    [self.view addSubview:mapView];
}
@end
