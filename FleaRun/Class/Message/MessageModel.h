//
//  MessageModel.h
//  FleaRun
//
//  Created by 吃兔子的萝卜 on 16/7/12.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property(nonatomic,copy)NSString *imageName, *userName , *lastMessage , *date;

@property(nonatomic,assign)NSInteger messageCount;

@end
