//
//  ChatViewController.m
//  FleaRun
//
//  Created by 吃兔子的萝卜 on 16/7/12.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import "ChatViewController.h"
#import "KeyBoardView.h"

#define btnWidth  ((chatfield.bounds.size.width-5*4)/5)

@interface ChatViewController ()
{
    UITableView *tableVeiw ;        //聊天表视图
    
    KeyBoardView *_chatView;              //打字栏
}

@end

@implementation ChatViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createNavItem];
    
    [self createChatView];
}
//导航标题栏
-(void)createNavItem{
    
    //导航栏左按钮
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [leftBtn setImage:[UIImage imageNamed:@"leftArrow.jpg"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem=leftBarBtn ;
    
    //导航栏右按钮
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 50)];
    [rightBtn setTitle:@"设置" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [rightBtn addTarget:self action:@selector(rightAnchor) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *RightBarBtn = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem =RightBarBtn;
    
    
    
    //标题写在init方法中，需要从数据库中获取名字
}


//聊天栏
-(void)createChatView{
    _chatView = [[KeyBoardView alloc]initWithFrame:CGRectMake(0, 602, self.view.bounds.size.width, 325)];
    _chatView.backgroundColor=[UIColor redColor];
    
    
    [self.view addSubview:_chatView];
}



#pragma mark - 按钮方法

//导航栏左按钮方法
-(void)leftBtnAction{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



//导航栏右按钮方法
-(void)rightBtnAction{
    
}




@end
