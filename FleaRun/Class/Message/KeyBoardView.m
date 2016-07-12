//
//  KeyBoardView.m
//  FleaRun
//
//  Created by 吃兔子的萝卜 on 16/7/12.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import "KeyBoardView.h"

#define SelfWidth self.bounds.size.width
#define SelfHeight self.bounds.size.height

#define typeFieldWidth   _typeField.bounds.size.width
#define typeFieldHeight  _typeField.bounds.size.height

#define turnView1Width   _turnView1.bounds.size.width
#define turnView1Height  _turnView1.bounds.size.height

@implementation KeyBoardView

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if ( self) {
        
        //打开时第一显示视图
        [self addSubview:[self createTurnView1]];      //添加子视图：第一视图View1
        [self addSubview:[self createSendBtn]];        //添加发送按钮
        
        //点击表情按钮显示的视图
        [self addSubview:[self createTurnView2]];      //添加子视图：表情视图View2
    }
    
    return self;
}


//翻转view1
-(UIView *)createTurnView1{
    _turnView1 = [[UIView alloc]initWithFrame:CGRectMake(SelfWidth*0.02, SelfHeight*0.01, SelfWidth*0.8, SelfHeight*0.19)];
    
    [_turnView1 addSubview:[self createTypeField]];    //View1添加输入框按钮
    [_turnView1 addSubview:[self createFaceBtn]];      //View1添加表情按钮
    [_turnView1 addSubview:[self createRecordBtn]];    //View1添加录音按钮
    [_turnView1 addSubview:[self createPhotoBtn]];     //View1添加照相按钮
    [_turnView1 addSubview:[self createImageBtn]];     //View1添加图片按钮
    [_turnView1 addSubview:[self createVideoBtn]];     //View1添加视频按钮
    
    
    return _turnView1;
}

//发送按钮
-(UIView *)createSendBtn{
    
    _sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(_turnView1.bounds.size.width+SelfWidth*0.025+SelfWidth*0.005, _turnView1.frame.origin.y, SelfWidth*0.155, _turnView1.bounds.size.height-_turnView1.frame.origin.y)];
    _sendBtn.backgroundColor=[UIColor grayColor];
    [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    _sendBtn.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    [_sendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_sendBtn addTarget:self action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
    
    return _sendBtn;
}

//翻转View2：表情视图
-(UIView *)createTurnView2{
    
    _turnView2 = [[FaceScrollView alloc]initWithFrame:CGRectMake(_turnView1.frame.origin.x, _turnView1.frame.size.height+_turnView1.frame.origin.y, SelfWidth*0.965, SelfHeight*0.79)];
    _turnView2.backgroundColor=[UIColor grayColor];
    
    return _turnView2;
    
}


#pragma mark-翻转View1的子视图

//输入框
-(UITextField *)createTypeField{
    
    _typeField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, turnView1Width, turnView1Height/2)];
    _typeField.layer.cornerRadius=5;
    _typeField.backgroundColor=[UIColor whiteColor];
    [_sendBtn becomeFirstResponder];
    
    return _typeField;
}

//表情按钮
-(UIButton *)createFaceBtn{
    
    _faceBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, typeFieldHeight, typeFieldWidth/5, turnView1Height/2)];
    [_faceBtn setImage:[UIImage imageNamed:@"021"] forState:UIControlStateNormal];
    [_faceBtn addTarget:self action:@selector(faceAction) forControlEvents:UIControlEventTouchUpInside];
    
    return _faceBtn;
}

//录音按钮
-(UIButton *)createRecordBtn{
    
    _recordBtn = [[UIButton alloc]initWithFrame:CGRectMake(typeFieldWidth/5, typeFieldHeight, typeFieldWidth/5, turnView1Height/2)];
    [_recordBtn setImage:[UIImage imageNamed:@"021"] forState:UIControlStateNormal];
    [_recordBtn addTarget:self action:@selector(recodAction) forControlEvents:UIControlEventTouchUpInside];
    
    return _recordBtn;
}

//图片按钮
-(UIButton *)createImageBtn{
    
    _imageBtn = [[UIButton alloc]initWithFrame:CGRectMake(2*typeFieldWidth/5, typeFieldHeight, typeFieldWidth/5, turnView1Height/2)];
    [_imageBtn setImage:[UIImage imageNamed:@"021"] forState:UIControlStateNormal];
    [_imageBtn addTarget:self action:@selector(imageAction) forControlEvents:UIControlEventTouchUpInside];
    
    return _imageBtn;
}

//视频按钮
-(UIButton *)createVideoBtn{
    
    _videoBtn = [[UIButton alloc]initWithFrame:CGRectMake(3*typeFieldWidth/5, typeFieldHeight, typeFieldWidth/5, turnView1Height/2)];
    [_videoBtn setImage:[UIImage imageNamed:@"021"] forState:UIControlStateNormal];
    [_videoBtn addTarget:self action:@selector(videoAction) forControlEvents:UIControlEventTouchUpInside];
    
    return _videoBtn;
}


//照相按钮
-(UIButton *)createPhotoBtn{
    
    _photoBtn = [[UIButton alloc]initWithFrame:CGRectMake(4*typeFieldWidth/5, typeFieldHeight, typeFieldWidth/5, turnView1Height/2)];
    [_photoBtn setImage:[UIImage imageNamed:@"021"] forState:UIControlStateNormal];
    [_photoBtn addTarget:self action:@selector(photoAction) forControlEvents:UIControlEventTouchUpInside];
    
    return _photoBtn;
}


#pragma mark-按钮方法

-(void)sendAction{
    NSLog(@"send");
    
}

//表情按钮方法
-(void)faceAction{
    static BOOL isTransform = NO;
    
    if (isTransform == NO) {
        
        [UIView animateWithDuration:0.35 animations:^{
            
            self.transform =CGAffineTransformTranslate(self.transform, 0, -SelfHeight*0.80);
        }];
        
        isTransform = YES;
        
    }else{
        
        [self viewIdentity:self];
        
        isTransform = NO;
    }
    
}

//照相按钮方法
-(void)photoAction{
    NSLog(@"photo");
    
}

//图片按钮方法
-(void)imageAction{
    NSLog(@"image");
    
}

//视频按钮方法
-(void)videoAction{
    NSLog(@"video");
    
}

//录音按钮方法
-(void)recodAction{
    NSLog(@"record");
    
}

#pragma mark-公共方法

//形变还原
-(void)viewIdentity:(UIView *)view{
    
    [UIView animateWithDuration:0.35 animations:^{
        
        view.transform = CGAffineTransformIdentity;
        
    }];
}



@end
