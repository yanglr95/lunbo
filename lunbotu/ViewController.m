//
//  ViewController.m
//  lunbotu
//
//  Created by tsc on 17-5-24.
//  Copyright (c) 2017年 eric. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 使用代理步骤：
    // 1> 设置代理对象
    // 2> 让代理对象遵守代理协议
    // 3> 让代理对象实现代理协议中的部分方法
    self.scrollView.delegate = self;
    
    // 1. 放一个 UIScrollView
    
    // 2. 向 UIScrollView 中添加内容（添加子控件）
    // 2.1 通过循环创建5个图片框
    CGFloat w = self.scrollView.frame.size.width;
    CGFloat h = self.scrollView.frame.size.height;
    CGFloat y = 0;
    for (int i = 0; i < 5; i++) {
        
        // 图片的名称
        NSString *imgName = [NSString stringWithFormat:@"img_0%d", i + 1];
        // 根据图片名称, 加载图片
        UIImage *img = [UIImage imageNamed:imgName];
        // 根据图片创建图片框
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        // 把图片库添加到 scroll view 中
        [self.scrollView addSubview:imgView];
        
        CGFloat x = i * w;
        imgView.frame = CGRectMake(x, y, w, h);
    }
    
    
    // 3. 告诉 UIScrollView, 里面的内容的大小
    self.scrollView.contentSize = CGSizeMake(5 * w, h);
    
    
    //---------------------------------------
    // 1> 去掉滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    // 2> 告诉 scroll view，进行分页（开启分页）
    self.scrollView.pagingEnabled = YES;
    
    
    // 4. 启动自动滚动
    // 4.1 启动一个计时器控件
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    
}


- (void)scrollImage
{
    //NSLog(@"000000");
    // 去除现在的滚动偏移
    CGPoint offset = self.scrollView.contentOffset;
    // 在现在的基础上累加一个宽度
    offset.x += self.scrollView.frame.size.width;
    
    // 判断是否到了最后一张图片
    if (offset.x >= self.scrollView.contentSize.width - self.scrollView.frame.size.width) {
        offset.x = 0;
    }
    
    // 把新的偏移值重新赋值给 scroll view
    [UIView animateWithDuration:0.8 animations:^{
        self.scrollView.contentOffset = offset;
    }];
    
}

// 监听 UIScrollView 的滚动事件, 在滚动事件中根据滚动偏移, 计算出当前滚动到了第几页
// 把第几页这个数字设置给 page control
// UIScrollView 是如何监听滚动事件的呢？是通过代理来监听的。
// 在 iOS 开发中代理的使用非常普遍
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 1. 获取滚动的偏移
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 2. 获取每页的宽度
    CGFloat pageW = self.scrollView.frame.size.width;
    
    
    // 3. 计算滚动了几页
    int page = offsetX / pageW;
    
    // 4. 将 page 设置给 page control
    self.pageControl.currentPage=page;
}

@end


















