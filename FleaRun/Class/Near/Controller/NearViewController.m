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

@interface NearViewController ()
{
    BMKMapManager* _mapManager;//创建百度地图管理器

}
@end

@implementation NearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mapManager = [[BMKMapManager alloc]init];
    BOOL ret = [_mapManager start:@"在此处输入您的授权Key"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    //创建百度地图
    [self createMapView];
}

-(void)createMapView{
    
    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view = mapView;
}
@end
