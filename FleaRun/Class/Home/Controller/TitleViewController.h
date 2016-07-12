//
//  TitleViewController.h
//  FleaRun
//
//  Created by 李志强 on 16/7/12.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CellType) {
    AllType     = 0,
    JobType     = 1,
    StoreType   = 2,
    RunType     = 3
};

@interface TitleViewController : UITableViewController

/** cell类型 */
@property (nonatomic, assign)CellType cellType;

@end
