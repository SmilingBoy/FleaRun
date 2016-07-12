//
//  TitleViewController.m
//  FleaRun
//
//  Created by 李志强 on 16/7/12.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import "TitleViewController.h"
#import "HomeTableCell.h"
#import <BmobSDK/Bmob.h>

@interface TitleViewController ()

/** 列表数据 */
@property (nonatomic, strong)NSMutableArray *dataList;

@end

@implementation TitleViewController


- (NSMutableArray *)dataList{
    
    if (!_dataList) {
        
        _dataList = [NSMutableArray array];
        
    }
    
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    //加载数据
    [self loadData];
    
}

//加载数据
- (void)loadData{
    
    BmobQuery *query = [BmobQuery queryWithClassName:@"HomeData"];
    
    [query setLimit:30];
    
    
    //根据类型tableView类型,加载不同类型的数据
    if (self.cellType == JobType) {
        [query whereKey:@"type" equalTo:@(0)];
    }
    
    if (self.cellType == StoreType) {
        [query whereKey:@"type" equalTo:@(1)];
    }
    
    if (self.cellType == RunType) {
        [query whereKey:@"type" equalTo:@(2)];
    }
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        
        [self.dataList addObjectsFromArray:array];
        
        [self.tableView reloadData];
        
    }];
    
}

#pragma mark --UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    //    NSLog(@"%ld", self.dataList.count);
    
    return self.dataList.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeTableCell *jobCell = [tableView dequeueReusableCellWithIdentifier:@"JobCell"];
    HomeTableCell *storeCell = [tableView dequeueReusableCellWithIdentifier:@"StoreCell"];
    HomeTableCell *runCell = [tableView dequeueReusableCellWithIdentifier:@"RunCell"];
    
    BmobObject *model = _dataList[indexPath.row];
    
    //    NSLog(@"%@", [model objectForKey:@"username"]);
    
    if ([[model objectForKey:@"type" ] integerValue] == 0) {
        
        if (!jobCell) {
            
            jobCell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HomeTableCell class]) owner:nil options:nil] objectAtIndex:0];
            
        }
        
        jobCell.obj = model;
        
        return jobCell;
    }
    
    if ([[model objectForKey:@"type" ] integerValue] == 1) {
        
        if (!storeCell) {
            
            storeCell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HomeTableCell class]) owner:nil options:nil] objectAtIndex:1];
            
        }
        
        storeCell.obj = model;
        
        return storeCell;
    }
    
    if ([[model objectForKey:@"type" ] integerValue] == 2) {
        
        if (!runCell) {
            
            runCell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HomeTableCell class]) owner:nil options:nil] objectAtIndex:2];
            
        }
        
        runCell.obj = model;
        
        return runCell;
    }
    
    return nil;
    
}


#pragma mark --UITableViewDelegate
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
