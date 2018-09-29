//
//  ViewController.m
//  ScrollView的自动布局以及IphoneX适配
//
//  Created by huangchengdu on 2018/9/28.
//  Copyright © 2018年 huangchengdu. All rights reserved.
//

#import "ViewController.h"
#import "MIFHomeSearchView.h"
#import "MIFHomeBannerView.h"
#import <Masonry/Masonry.h>
#import "Header.h"

@interface ViewController ()<MIFHomeSearchViewDelegate, MIFHomeBannerViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong)MIFHomeSearchView *homeSearchView;
@property (nonatomic, strong)MIFHomeBannerView *homeBarView;
@property(nonatomic, strong)UIScrollView *scrollView;
@property(nonatomic, strong)UIView *scrollContentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor greenColor];
    if (@available(iOS 11.0, *)){
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.scrollView];
    
    self.scrollContentView = [[UIView alloc] init];
    self.scrollContentView.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:self.scrollContentView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuideTop);
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
    }];
    
    [self.scrollContentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(ScreenWidth);
        make.left.top.bottom.equalTo(self.scrollView);
    }];
    
    self.homeSearchView = [[MIFHomeSearchView alloc]init];
    self.homeSearchView.delegate = self;
    [self.scrollContentView addSubview:self.homeSearchView];
    
    [self.homeSearchView updateWithMoney:0 showModule:HomeSearchShowModuleDefault];
    [self.homeSearchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.scrollContentView);
    }];
    self.homeBarView = [[MIFHomeBannerView alloc]init];
    self.homeBarView.delegate = self;
    [self.scrollContentView addSubview:self.homeBarView];
    [self.homeBarView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.scrollContentView);
        make.top.equalTo(self.homeSearchView.mas_bottom);
    }];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"%f",scrollView.contentOffset.y);
    if ((scrollView.contentOffset.y <= 50)) {
        scrollView.bounces = NO;
        NSLog(@"禁止下拉");
    }else if (scrollView.contentOffset.y >= 50){
        scrollView.bounces = YES;
        NSLog(@"允许上拉");
    }
}

#pragma mark MIFHomeSearchViewDelegate代理方法
-(void)clickDetailButton{
    self.scrollView.contentOffset = CGPointZero;
    [self.homeSearchView updateWithMoney:12 showModule:HomeSearchShowModuleQuery];
    NSLog(@"clickDetailButton");
}

- (void)clickSearchButton{
    self.scrollView.contentOffset = CGPointZero;
    [self.homeSearchView updateWithMoney:12 showModule:HomeSearchShowModuleDefault];
    NSLog(@"clickSearchButton");
}

#pragma mark MIFHomeBannerViewDelegate代理方法

- (void)clickHomeBannerEvent:(HomeBannerEvent)eventType{
    NSLog(@"点击事件===%ld", eventType);
}


@end
