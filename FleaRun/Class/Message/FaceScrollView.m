//
//  FaceScrollView.m
//  FaceDemo
//
//  Created by sunfeng on 16/6/17.
//  Copyright © 2016年 SunFeng. All rights reserved.
//

#import "FaceScrollView.h"

#define kFaceScreenW [[UIScreen mainScreen] bounds].size.width

#define SelfWidth self.bounds.size.width
#define SelfHeight self.bounds.size.height


#define kFaceScreenH 220

@implementation FaceScrollView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadData];
        [self loadViews];
    }
    return self;
}

//读取数据
-(void)loadData{
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"emoticons" ofType:@"plist"];
    _dataList=[NSArray arrayWithContentsOfFile:path];
    
}


- (void)loadViews{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SelfWidth, SelfHeight*0.99)];

    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator=NO;
    _scrollView.bounces=NO;
    
    //计算需要多少页
    NSInteger pageCount = _dataList.count/28 + ((_dataList.count%28 == 0)?0:1);
    
    _scrollView.contentSize = CGSizeMake(pageCount * SelfWidth, SelfHeight);
    
    for (int i = 0; i < pageCount; i++) {
        //每一页的内容
        FaceViewItem *item = [[FaceViewItem alloc] init];
        item.frame = CGRectMake(SelfWidth*i, 0, SelfWidth, SelfHeight);

        //从大的数组中截取小数组，注意三目运算符的使用
        NSArray *subArr = [_dataList subarrayWithRange:NSMakeRange(i * 28, ((_dataList.count - i * 28) < 28) ? (_dataList.count%28) : 28)];
        
        item.dataList = subArr;
        
        [_scrollView addSubview:item];
    }
    
    [self addSubview:_scrollView];
    
}




@end



@implementation FaceViewItem
//也可以使用宏
CGFloat space = 20;//图片间距
CGFloat itemW = 30;//图片宽度       7*5宽6间隔    (*5/41)
CGFloat itemH = 30;//图片高度

-(void)setDataList:(NSArray *)dataList{
    _dataList = dataList;
    [self createImage];
}

//创建图片
- (void)createImage{
    //绘制背景图片
    UIImage *image = [UIImage imageNamed:@"emoticon_keyboard_background"];
    
    [image drawInRect:self.bounds];
    
    //创建小图片
    for (int i = 0; i < self.dataList.count; i++) {
        //图片名
        NSString *imageName = [self.dataList[i] objectForKey:@"png"];
        UIImage *image = [UIImage imageNamed:imageName];
        
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:[self frameAtIndex:i]];
        imageV.image = image;
        [self addSubview:imageV];
        
    }

}


- (CGRect)frameAtIndex:(int )index{

    int x = index%7;
    int y = index/7;
    
    return CGRectMake(x*itemW + space*(x+1), itemH*y+space*(y+1), itemW, itemH);

}













-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //创建放大镜和里面的imageView
    if (_magnifier == nil) {
        
        _magnifier  =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"emoticon_keyboard_magnifier"]];
        
        //xy暂时不设置，稍后移动
        _magnifier.frame = CGRectMake(0, 0, 64, 92);
        
        _magnifier.hidden = YES;
        
        _gif = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        
        [_magnifier addSubview:_gif];
        [self addSubview:_magnifier];
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    NSLog(@"%@",NSStringFromCGPoint(point));
    //获取当前touch点对应的index
    
    int index = [self indexForPoint:point];
    
    //判断 index 如果大于 dataList.count  则返回
    if (index>=self.dataList.count) {
        return;
    }

    //获取index对应的frame
    CGRect frameIndex = [self frameAtIndex:index];
    
    //设置放大镜中心点
    CGFloat centerX = frameIndex.origin.x + frameIndex.size.width/2;
    CGFloat centerY = frameIndex.origin.y + frameIndex.size.height/2;
    


    
    _magnifier.hidden = NO;
    [_magnifier setCenter:CGPointMake(centerX, centerY-itemH-space)];

    
    //设置放大镜里面的图片
    NSString *imageName = [self.dataList[index] objectForKey:@"png"];
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    [_gif setImage:image];
    
    [(UIScrollView *)self.superview setScrollEnabled:NO];   //点击时关闭滑动视图的滑动属性
    
}


- (int)indexForPoint:(CGPoint)point{
    
    int x = point.x/(self.bounds.size.width/7);
    int y = point.y/(self.bounds.size.height/4);

    return y*7 + x;
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    //获取当前touch点对应的index
    int index = [self indexForPoint:point];
    
    //判断 index 如果大于 dataList.count  则返回
    if (index>=self.dataList.count) {
        return;
    }
    
    //根据index 获取到center
    CGRect frameIndex = [self frameAtIndex:index];
    CGFloat centerX = frameIndex.origin.x+frameIndex.size.width/2;
    CGFloat centerY = frameIndex.origin.y+frameIndex.size.height/2;


    //显示放大镜
    NSString *pngName = [self.dataList[index] objectForKey:@"png"];
    UIImage *image = [UIImage imageNamed:pngName];
    [_gif setImage:image];
    
    //设置放大镜的位置
    [_magnifier setCenter:CGPointMake(centerX, centerY-itemH-space)];



}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [(UIScrollView *)self.superview setScrollEnabled:YES];

    _magnifier.hidden = YES;
    
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    //获取当前touch点对应的index
    int index = [self indexForPoint:point];
    
    //判断 index 如果大于 dataList.count  则返回
    if (index >= self.dataList.count) {
        return;
    }
    
    NSString *name = [[_dataList objectAtIndex:index] objectForKey:@"chs"];
    NSLog(@"%@",name);

}


@end



















