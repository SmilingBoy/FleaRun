//
//  TabBar.m
//  BaiSiBuDeJie
//
//  Created by lx on 16/6/15.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "TabBar.h"

@interface TabBar ()

@property (nonatomic, weak)UIButton *publishButton;

@end

@implementation TabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_me_click_icon"] forState:UIControlStateSelected];
        
        [self addSubview:publishButton];
        
        self.publishButton = publishButton;
        
    }
    return self;
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    //设置publishButton的frame
    self.publishButton.bounds = CGRectMake(0, 0, self.publishButton.currentBackgroundImage.size.width, self.publishButton.currentBackgroundImage.size.height);
    self.publishButton.center = CGPointMake(self.width* 0.5, self.height * 0.5);
    
    //设置其他的Button
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / 5;
    CGFloat buttonH = self.frame.size.height;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {

        if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
        
        // 计算按钮的x值
        CGFloat buttonX = buttonW * ((index > 1)?(index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        index++;
    }

}

@end
