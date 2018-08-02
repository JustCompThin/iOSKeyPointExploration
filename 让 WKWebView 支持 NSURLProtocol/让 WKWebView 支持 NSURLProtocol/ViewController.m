//
//  ViewController.m
//  让 WKWebView 支持 NSURLProtocol
//
//  Created by huangchengdu on 17/3/17.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import "ViewController.h"
#import "WKWebViewController.h"
#import "UIWebViewController.h"



@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)testWKWebView:(id)sender {
    //正常情况在appdelegate或者load方法中
    [self.navigationController pushViewController:[[WKWebViewController alloc]init] animated:YES];
    
}

- (IBAction)testWKWebViewTwo:(id)sender {
    WKWebViewController *VC = [[WKWebViewController alloc]init];
    VC.isLocalModel = YES;
    [self.navigationController pushViewController:VC animated:YES];
}


- (IBAction)testUIViewView:(id)sender {

    [self.navigationController pushViewController:[[UIWebViewController alloc]init] animated:YES];
    
}



@end
