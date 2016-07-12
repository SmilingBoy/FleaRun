//
//  HomeViewController.m
//  FleaRun
//
//  Created by 李志强 on 16/7/11.
//  Copyright © 2016年 lizhiqiang. All rights reserved.
//

#import "HomeViewController.h"
#import "TitleViewController.h"

@interface HomeViewController ()<UIScrollViewDelegate>

/** 标题视图 */
@property (nonatomic, weak)UIView *titleView;

/** 当前选中的button */
@property (nonatomic, weak)UIButton *currentButton;

/** 内容视图 */
@property (nonatomic, weak)UIScrollView *contentView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //导航栏标题
    [self setUpNavigationBar];
    
    //设置子视图控制器
    [self setUpChildViewController];
    
    //设置标题视图
    [self setUpTitleView];
    
    //设置内容视图
    [self setUpContentView];
    
}

//导航栏标题
- (void)setUpNavigationBar{
    
    
}

- (void)setUpChildViewController{
    
    //全部
    TitleViewController *all = [[TitleViewController alloc] init];
    all.title = @"全部";
    all.cellType = AllType;
    [self addChildViewController:all];
    
    //全部
    TitleViewController *job = [[TitleViewController alloc] init];
    job.title = @"兼职";
    job.cellType = JobType;
    [self addChildViewController:job];
    
    //全部
    TitleViewController *store = [[TitleViewController alloc] init];
    store.title = @"杂货";
    store.cellType = StoreType;
    [self addChildViewController:store];
    
    //全部
    TitleViewController *run = [[TitleViewController alloc] init];
    run.title = @"跑腿";
    run.cellType = RunType;
    [self addChildViewController:run];
    
}


//设置标题视图
- (void)setUpTitleView{
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 35)];
    
    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    
    _titleView = titleView;
    [self.view addSubview:titleView];
    
    //添加button
    CGFloat width = titleView.width / self.childViewControllers.count;
    CGFloat height = titleView.height;
    
    for (int i = 0; i < self.childViewControllers.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.tag = i + 1000;
        button.width = width;
        button.height = height;
        button.left = i * width;
        
        [button setTitle:self.childViewControllers[i].title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [titleView addSubview:button];
        
        if (i == 0) {
            
            _currentButton = button;
            
            //必须有这一条
            [button.titleLabel sizeToFit];
            [self titleButtonClick:button];
            
        }
        
    }
    
}

- (void)titleButtonClick:(UIButton *)sender{
    
    if (sender == _currentButton) {
        
        sender.selected = YES;
        
//        [self changeFrameOfIndictorView:sender];
        
        return;
        
    }
    
    sender.selected = YES;
    
    _currentButton.selected = NO;
    
    _currentButton = sender;
    
    [UIView animateWithDuration:0.5 animations:^{
        
//        [self changeFrameOfIndictorView:sender];
        
    }];
    
    [self.contentView setContentOffset:CGPointMake((sender.tag - 1000) * self.contentView.width, 0) animated:YES];
    
}

//设置内容视图
- (void)setUpContentView{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    //    contentView.backgroundColor = [UIColor greenColor];
    
    contentView.contentSize = CGSizeMake(self.childViewControllers.count * contentView.width, contentView.height);
    contentView.delegate = self;
    contentView.scrollEnabled = YES;
    
    contentView.showsVerticalScrollIndicator = NO;
    contentView.showsHorizontalScrollIndicator = NO;
    contentView.bounces = NO;
    contentView.pagingEnabled = YES;
    
    _contentView = contentView;
    [self.view insertSubview:contentView atIndex:0];
    
    [self scrollViewDidEndScrollingAnimation:contentView];
    
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    UITableViewController *viewControlelr = self.childViewControllers[index];
    
    viewControlelr.view.left = index * scrollView.width;
    viewControlelr.view.top = 0;
    viewControlelr.view.height = scrollView.height;
    
    CGFloat bottom = self.tabBarController.tabBar.height;
    CGFloat top = CGRectGetMaxY(self.titleView.frame);
    viewControlelr.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    // 设置滚动条的内边距
    viewControlelr.tableView.scrollIndicatorInsets = viewControlelr.tableView.contentInset;
    
    [scrollView addSubview:viewControlelr.view];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    UIButton *button = [self.titleView viewWithTag:(index + 1000)];
    
    [self titleButtonClick:button];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
