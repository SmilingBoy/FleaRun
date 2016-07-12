//
//  BaseTabBarController.m
//  FleaRun
//
//  Created by 李志强 on 16/7/11.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "NearViewController.h"
#import "MessageViewController.h"
#import "MeViewController.h"
#import "TabBar.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self AddViewControllers];
    
    [self setUpTabBarText];
    
    
    [self setValue:[[TabBar alloc] init] forKey:@"tabBar"];
}

/**
 *  设置标签栏字体颜色和字体大小
 */
- (void)setUpTabBarText{
    
    UITabBarItem *tabbar = [UITabBarItem appearance];
    
    NSDictionary *dicNormal = @{NSFontAttributeName : [UIFont systemFontOfSize:12],
                                NSForegroundColorAttributeName : [UIColor lightGrayColor]};
    NSDictionary *dicSel = @{NSFontAttributeName : [UIFont systemFontOfSize:12],
                             NSForegroundColorAttributeName : [UIColor blackColor]};
    
    [tabbar setTitleTextAttributes:dicNormal forState:UIControlStateNormal];
    [tabbar setTitleTextAttributes:dicSel forState:UIControlStateSelected];
}

/**
 *  添加视图控制器
 */
- (void)AddViewControllers{
    
    //首页
    HomeViewController *home = [[HomeViewController alloc] init];
    [self addOneViewController:home
                         title:@"首页"
                         image:[UIImage imageNamed:@"tabBar_essence_icon"]
                      selImage:[UIImage imageNamed:@"tabBar_essence_click_icon"]];
    //附近
    NearViewController *near = [[NearViewController alloc] init];
    [self addOneViewController:near
                         title:@"附近"
                         image:[UIImage imageNamed:@"tabBar_new_icon"]
                      selImage:[UIImage imageNamed:@"tabBar_new_click_icon"]];
    //消息
    MessageViewController *messages = [[MessageViewController alloc] init];
    [self addOneViewController:messages
                         title:@"消息"
                         image:[UIImage imageNamed:@"tabBar_friendTrends_icon"]
                      selImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"]];
    //我
    MeViewController *me = [[MeViewController alloc] init];
    [self addOneViewController:me
                         title:@"我"
                         image:[UIImage imageNamed:@"tabBar_me_icon"]
                      selImage:[UIImage imageNamed:@"tabBar_me_click_icon"]];
    
}

//设置视图控制器
- (void)addOneViewController:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selImage:(UIImage *)selImage{
    
//    vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];

    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    
    BaseNavigationController *nvc = [[BaseNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nvc];
    
}

@end
