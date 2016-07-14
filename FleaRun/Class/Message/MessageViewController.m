//
//  MessageViewController.m
//  FleaRun
//
//  Created by 李志强 on 16/7/11.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"
#import "MessageModel.h"

#import "ChatViewController.h"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UINavigationController *_chatNav ;        //聊天视图控制器
}


@end

@implementation MessageViewController

-(id)init{
    self = [super init];
    
    if (self) {
        self.title=@"消息";
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createNavItem];
    
    [self createTableView];
    
    [self createChatVC];
    
}


//设置导航栏属性
-(void)createNavItem{
    
    //导航栏左按钮
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
//    [leftBtn setImage:[UIImage imageNamed:@"leftArrow.jpg"] forState:UIControlStateNormal];
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem=leftBarBtn ;
    
    //导航栏右按钮
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 50)];
    [rightBtn setTitle:@"设置" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    UIBarButtonItem *RightBarBtn = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem =RightBarBtn;
    
    
    
}


//创建会话表视图
-(void)createTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 618) style:UITableViewStylePlain];
    tableView.backgroundColor=[UIColor yellowColor];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableHeaderView =[self createHeaderView];
    
    tableView.rowHeight = 50 ;
    [self.view addSubview:tableView];
    
}


//初始化聊天视图控制器
-(void)createChatVC{
    
    ChatViewController *chatVC = [[ChatViewController alloc]init];
    
    _chatNav = [[UINavigationController alloc]initWithRootViewController:chatVC];
    
}

//创建表视图的头视图
-(UIView *)createHeaderView{
    
    //头视图
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    _headerView.backgroundColor = [UIColor grayColor];
    
    
    //头视图里的搜索框
    UITextField *sousuo = [[UITextField alloc]initWithFrame:CGRectMake(10, 5, self.view.bounds.size.width-20, _headerView.bounds.size.height-10)];
    sousuo.backgroundColor = [UIColor whiteColor];
    sousuo.layer.cornerRadius = 5;
    sousuo.placeholder = @"     搜 索 联 系 人";
    
    [_headerView addSubview:sousuo];
    return _headerView;
    
}


#pragma mark-表视图代理方法
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 18;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row<3) {
        
        MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageTableViewCell" owner:nil options:nil] objectAtIndex:0];
            
        }
        
        MessageModel *messageModel = [[MessageModel alloc]init];
        cell.model=messageModel;

        return  cell;

    }else{
        
        MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageTableViewCell" owner:nil options:nil] objectAtIndex:1];
            
        }
        
        MessageModel *messageModel = [[MessageModel alloc]init];
        cell.model=messageModel;
        
        return  cell;

    }
    
    
}


//头视图
-(nullable UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    _headerView.backgroundColor = [UIColor grayColor];
    
    UITextField *sousuo = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, self.view.bounds.size.width-20, _headerView.bounds.size.height-20)];
    sousuo.backgroundColor = [UIColor whiteColor];
    
    [_headerView addSubview:sousuo];
    return _headerView;
}

//点击单元格方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row<3) {
        
        NSLog(@"***********************");
        
    }else {
        
//        [self.navigationController pushViewController:_chatNav animated:YES];
        [self presentViewController:_chatNav animated:YES completion:^{
            
        }];
        
    }
    
    
    
    

}

@end
