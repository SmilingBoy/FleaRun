//
//  FaceScrollView.h
//  FaceDemo
//
//  Created by sunfeng on 16/6/17.
//  Copyright © 2016年 SunFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FaceScrollView : UIView
{
    
    //scollView
    UIScrollView *_scrollView;
    
    //data
    NSArray*_dataList;
    
    
    
    
    //放大镜
    UIImageView *_magnifier;
    //放大镜里面的图片
    UIImageView *_gif;
    
}

//数据
@property (nonatomic,strong)NSArray *dataList;


@end

@interface FaceViewItem : UIView{
    //放大镜
    UIImageView *_magnifier;
    //放大镜里面的图片
    UIImageView *_gif;

}

//数据
@property (nonatomic,strong)NSArray *dataList;

@end

