//
//  MessageTableViewCell.h
//  FleaRun
//
//  Created by 吃兔子的萝卜 on 16/7/12.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "MessageModel.h"

@interface MessageTableViewCell : UITableViewCell

//cell1
@property (strong, nonatomic) IBOutlet UIImageView *cell1Image;

@property (strong, nonatomic) IBOutlet UILabel *Cell1Label;


 
//cell2
@property (strong, nonatomic) IBOutlet UIImageView *cell2Image;    //用户头像

@property (weak, nonatomic) IBOutlet UILabel *cell2Name;           //用户名

@property (weak, nonatomic) IBOutlet UILabel *cell2Message;        //最新一条的消息

@property (weak, nonatomic) IBOutlet UILabel *cell2Date;           //最新一条消息的日期

@property (weak, nonatomic) IBOutlet UILabel *cell2MessageCount;   //未查看的消息数量





@property(nonatomic,strong)MessageModel *model ;

@end