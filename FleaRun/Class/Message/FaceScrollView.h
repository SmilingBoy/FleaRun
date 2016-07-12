//
//  FaceScrollView.h
//  FleaRun
//
//  Created by 吃兔子的萝卜 on 16/7/12.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
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
