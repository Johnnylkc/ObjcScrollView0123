//
//  LandingVC.m
//  ObjcScrollView0123
//
//  Created by 劉坤昶 on 2016/1/23.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "LandingVC.h"

@interface LandingVC () <UIScrollViewDelegate>

@property(strong,nonatomic) UIScrollView *scrollView;
@property(strong,nonatomic) NSArray *imageArray;
@property(strong,nonatomic) UIPageControl *pageControl;

@end

@implementation LandingVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
   
    ////這個陣列放圖片的名字
    self.imageArray = @[@"001",@"002",@"003",@"004",@"005",@"006"];
    
    
    
    self.scrollView =
    [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    
    
    CGFloat width,height;
    width = self.scrollView.frame.size.width;
    height = self.scrollView.frame.size.height;
    
    
    for (int i = 0; i<self.imageArray.count; i++)
    {
        UIImageView *classImage = [[UIImageView alloc] init];
        classImage.frame = CGRectMake(i*width, 0, width, height);
        classImage.contentMode = UIViewContentModeScaleAspectFill;
        classImage.clipsToBounds = YES;
        
        UIImage *image = [UIImage imageNamed:self.imageArray[i]];
        classImage.image = image;
        
        [self.scrollView addSubview:classImage];
        
    }
    
    self.scrollView.contentSize = CGSizeMake(self.imageArray.count*width, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.bounces = NO;
    
    [self.view addSubview: self.scrollView];
    
    
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.frame = CGRectMake(width-110 , height-20, 100, 10);
    self.pageControl.numberOfPages = self.imageArray.count;
    
    [self.view addSubview:self.pageControl];
    
    

}


- ( void )scrollViewDidScroll:(UIScrollView * )scrollView
{
    /*
     pageControl.currentPage 顧名思義就是目前頁面的意思
     這個地方我卡最久 因為到底要怎麼樣pageControl顯示白色的點 就代表你scroll到第幾張照片呢？？
    這個做法就是 設一個整數參數page 這個page代表著scrollView左上角那個點累積的位移量 (scrollView.contentOffset.x) 除以
    整個scrollView的寬，但神奇的是我如果兩個前後對調，白點就會亂跑 這倒是蠻奇怪的
     可以跑跑看 scroll照片 看log出來得值
     */
     
    NSInteger page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
   
    NSLog(@"%f %f",self.scrollView.contentOffset.x,self.scrollView.frame.size.width);
    
    self.pageControl.currentPage = page;
}




- (void)didReceiveMemoryWarning
{
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
