//
//  ViewController.m
//  WebViewContactWithJS
//
//  Created by 周中广 on 15/8/25.
//  Copyright (c) 2015年 周中广. All rights reserved.
//

#import "ViewController.h"
#import "FunctionsForWebViewPages.h"

@interface ViewController () <UIWebViewDelegate>
{
    NSString * strCallBack;
    FunctionsForWebViewPages * functionForWebView;
    
    NSURLConnection *_urlConnection;
    
    NSURLRequest *_request;
    
    BOOL _authenticated;
}

@property (strong, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"h5-ability" ofType:@"html"];
//    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    [self.myWebView loadHTMLString:html baseURL:baseURL];
    
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://u.cmread.com/D0022032?cf=1001&phone=18758097947&session=1G1I5WEKJHTFHABXOQ6BZ8GS&nonce=tfnfriitejnwnjxs&encpn=6895751d95bdb4105f0a575a524ef45c&num=18758097947"]]];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -
#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString * requestString = [[request URL] absoluteString];
    requestString = [requestString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //JS和native交互
    NSArray * array = [requestString componentsSeparatedByString:@"webkitpostnotification:"];
    if ([array count] >1) {
        
        NSString * strJson =[array objectAtIndex:1];
        NSDictionary * dict =[NSJSONSerialization JSONObjectWithData:[strJson dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];;
        
        functionForWebView = [[FunctionsForWebViewPages alloc] init];
        functionForWebView.webVC = self;
        functionForWebView.webView = self.myWebView;
        
        //调到FunctionForWebViewPages类里面执行H5能力
        [functionForWebView performSelectorWithObject:dict];
        return NO;
    }

    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
