//
//  WebViewController.m
//  团购
//
//  Created by Jones on 12/1/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController (){
    UIWebView *webView;
}

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    // 网页 1 webview 2 request 3 load
    webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    NSString *url = @"http://www.imooc.com";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [webView loadRequest:request];
     */
    //  打开浏览器
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.imooc.com"] options:nil completionHandler:nil];
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
