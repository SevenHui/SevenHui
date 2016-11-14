//
//  BH_WKWebView_VC.m
//  SummerQ
//
//  Created by apple on 16/7/28.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//

#import "BH_WKWebView_VC.h"
#import <WebKit/WebKit.h>
@interface BH_WKWebView_VC ()
<WKScriptMessageHandler>
/**WKWebview*/
@property (nonatomic, retain)WKWebView *wkWebView;

@end

@implementation BH_WKWebView_VC
-(void)dealloc{
    [_strURL release];
    [_wkWebView release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    [self creatWKWebView];
    
}
-(void)config{
    self.view.backgroundColor = [UIColor whiteColor];
#pragma 自定义导航返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回键"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];

}
#pragma mark - 返回按钮
- (void)leftAction:(UIBarButtonItem *)sender{

    [self.navigationController popViewControllerAnimated:YES];
}
-(void)creatWKWebView{
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
    // 设置html页面 显示字体大小 默认是0
    config.preferences.minimumFontSize = 0;
    // 是否启用js 默认是yes
    config.preferences.javaScriptEnabled = YES;
    [config.userContentController addScriptMessageHandler:self name:@"AppModel"];
    
    self.wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64 - 49) configuration:config];
    [self.view addSubview:_wkWebView];
    self.wkWebView.scrollView.backgroundColor = [UIColor whiteColor];
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.strURL]]];
    
}
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    
    if ([message.name isEqualToString:@"AppModel"]) {
        NSLog(@"%@", message.body);
        
    }
    
}


@end
