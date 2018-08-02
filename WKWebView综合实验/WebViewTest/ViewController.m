//
//  ViewController.m
//  WebViewTest
//
//  Created by huangchengdu on 2018/1/25.
//  Copyright © 2018年 huangchengdu. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()
@property (strong, nonatomic) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"scalesPageToFit验证";
   
    
    self.webView = [[UIWebView alloc]init];
    self.webView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.webView.backgroundColor = [UIColor greenColor];
    self.webView.scalesPageToFit = YES;
    [self.view addSubview:self.webView];
    int dd = arc4random();
    NSString *url = [NSString stringWithFormat:@"%@%d",@"https://pages.ctrip.com/ztrip/market/zhongxiexingtest/#/index?time=",dd];
    NSLog(@"%@",url);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60];
    [self.webView loadRequest:request];;
    
}




@end
