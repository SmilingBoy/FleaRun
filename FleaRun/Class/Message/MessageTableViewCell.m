//
//  MessageTableViewCell.m
//  FleaRun
//
//  Created by 吃兔子的萝卜 on 16/7/12.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setModel:(MessageModel *)model{
    
    _model = model;
    
    self.cell2Image.image = [UIImage imageNamed:_model.imageName];
    
    self.cell2Name.text = _model.userName;
    
    self.cell2Message.text=_model.lastMessage;
    
    self.cell2Date.text = _model.date;
    
    self.cell2MessageCount.text = [NSString stringWithFormat:@"%lu",_model.messageCount] ;
    
    
    
}

@end
