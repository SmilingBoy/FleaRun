//
//  HomeTableCell.m
//  FleaRun
//
//  Created by 李志强 on 16/7/12.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import "HomeTableCell.h"
#import <BmobSDK/Bmob.h>
#import <UIImageView+WebCache.h>

@interface HomeTableCell ()

//JobCell
@property (weak, nonatomic) IBOutlet UILabel *userName1;            //用户名
@property (weak, nonatomic) IBOutlet UIImageView *userPhoto1;       //头像
@property (weak, nonatomic) IBOutlet UIImageView *image01_1;        //店铺图片01
@property (weak, nonatomic) IBOutlet UILabel *updateAt1;            //发布时间
@property (weak, nonatomic) IBOutlet UILabel *description1;         //简介
@property (weak, nonatomic) IBOutlet UILabel *wage1;                //薪资


//StoreCell
@property (weak, nonatomic) IBOutlet UILabel *userName2;
@property (weak, nonatomic) IBOutlet UIImageView *userPhoto2;
@property (weak, nonatomic) IBOutlet UIImageView *image01_2;
@property (weak, nonatomic) IBOutlet UILabel *updateAt2;
@property (weak, nonatomic) IBOutlet UILabel *description2;
@property (weak, nonatomic) IBOutlet UILabel *wage2;

//RunCell
@property (weak, nonatomic) IBOutlet UILabel *userName3;
@property (weak, nonatomic) IBOutlet UIImageView *userPhoto3;
@property (weak, nonatomic) IBOutlet UILabel *updateAt3;
@property (weak, nonatomic) IBOutlet UILabel *description3;
@property (weak, nonatomic) IBOutlet UILabel *wage3;


@end

@implementation HomeTableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}


- (void)setObj:(BmobObject *)obj{
    
    _obj = obj;
    
    NSInteger type = [[obj objectForKey:@"type"] integerValue];
    
    //根据数据类型,对相应的cell赋值.
    //JobCell
    if (type == 0) {
        
        self.userName1.text = [obj objectForKey:@"username"];
        
        self.updateAt1.text = [obj.updatedAt description];
        
        //设置头像文件
        BmobFile *userPhotoFile1 = (BmobFile *)[_obj objectForKey:@"userPhoto"];
        if (userPhotoFile1.url) {
            
            NSURL *userPhotoUrl1 = [NSURL URLWithString:userPhotoFile1.url];
            [self.userPhoto1 sd_setImageWithURL:userPhotoUrl1];
        }
        
        //简介
        self.description1.text = [obj objectForKey:@"description"];

    }
    
    //StoreCell
    if (type == 1) {
        
        self.userName2.text = [obj objectForKey:@"username"];
        
        self.updateAt2.text = [obj.updatedAt description];
        
        BmobFile *userPhotoFile2 = (BmobFile *)[_obj objectForKey:@"userPhoto"];
        if (userPhotoFile2.url) {
            
            NSURL *userPhotoUrl2 = [NSURL URLWithString:userPhotoFile2.url];
            [self.userPhoto2 sd_setImageWithURL:userPhotoUrl2];
        }
        
        //简介
        self.description2.text = [obj objectForKey:@"description"];
        
    }
    
    if (type == 2) {
        
        //RunCell
        self.userName3.text = [obj objectForKey:@"username"];
        
        self.updateAt3.text = [obj.updatedAt description];
        
        BmobFile *userPhotoFile3 = (BmobFile *)[_obj objectForKey:@"userPhoto"];
        if (userPhotoFile3.url) {
            
            NSURL *userPhotoUrl3 = [NSURL URLWithString:userPhotoFile3.url];
            [self.userPhoto3 sd_setImageWithURL:userPhotoUrl3];
        }
        
        //简介
        self.description3.text = [obj objectForKey:@"description"];
    }
    
}

@end
