//
//  MineTableViewHeader.h
//  FleaRun
//
//  Created by 王一 on 16/7/12.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
//定义事件处理
typedef void(^MineHeaderClickBlock)(NSInteger clickTag);
@interface MineTableViewHeader : UIView

//表视图
@property(nonatomic,strong)UIView *tableView;
//背景视图
@property(nonatomic,strong)UIView *backImageView;

//头像视图
@property(nonatomic,strong)UIView *picImageView;
//用户名
@property(nonatomic,copy)NSString *userName;
//手机
@property(nonatomic,copy)NSString *phoneNumber;
//
@property(nonatomic,copy)NSMutableArray *navArray;
//事件处理操作
@property(nonatomic,copy)MineHeaderClickBlock operation;

/**
 *  通过表视图，背景视图，头像视图初始化
 */
-(void)headerWithableView:(UITableView *)tableView backgroundView:(UIView *)view subviews:(UIView *)subviesw;




@end
