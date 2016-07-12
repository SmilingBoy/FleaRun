//
//  KeyBoardView.h
//  FleaRun
//
//  Created by 吃兔子的萝卜 on 16/7/12.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceScrollView.h"


@interface KeyBoardView : UIView
{
    UIView *_turnView1;          //翻转View1
    
    FaceScrollView *_turnView2;          //翻转View2:
    
    UIButton *_sendBtn;          //发送按钮
    
    
    //View1的子视图
    UITextField *_typeField;     //打字栏
    UIButton *_faceBtn;          //表情按钮
    UIButton *_photoBtn;         //照相按
    UIButton *_imageBtn;         //图片按钮
    UIButton *_videoBtn;         //视频按钮
    UIButton *_recordBtn;        //录音按钮
    
    
    //View2的子视图
    
    
}

-(id)initWithFrame:(CGRect)frame;

@end