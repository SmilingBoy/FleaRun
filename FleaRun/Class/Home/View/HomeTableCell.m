//
//  HomeTableCell.m
//  FleaRun
//
//  Created by 李志强 on 16/7/12.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import "HomeTableCell.h"
#import <BmobSDK/Bmob.h>

@interface HomeTableCell ()

//JobCell
@property (weak, nonatomic) IBOutlet UILabel *userName1;

//StoreCell
@property (weak, nonatomic) IBOutlet UILabel *userName2;

//RunCell
@property (weak, nonatomic) IBOutlet UILabel *userName3;

@end

@implementation HomeTableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setObj:(BmobObject *)obj{
    
    _obj = obj;
    
    //JobCell
    self.userName1.text = [obj objectForKey:@"username"];
    
    //StoreCell
    self.userName2.text = [obj objectForKey:@"username"];
    
    //RunCell
    self.userName3.text = [obj objectForKey:@"username"];
    
}

@end
