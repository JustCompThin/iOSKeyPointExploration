//
//  WKWebViewController.m
//  让 WKWebView 支持 NSURLProtocol
//
//  Created by huangchengdu on 17/3/17.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>
@interface WKWebViewController ()
@property(nonatomic,strong)WKWebView *webView;
@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    self.webView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.webView];
    
    if (self.isLocalModel) {
        NSString *localHtmlFilePath = [[NSBundle mainBundle] pathForResource:@"file.html" ofType:nil];
        NSString *html = [NSString stringWithContentsOfFile:localHtmlFilePath encoding:NSUTF8StringEncoding error:nil];
        [self.webView loadHTMLString:html baseURL:nil];
    }else{
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://bbs.wacai.com"]]];
    }
}



@end
