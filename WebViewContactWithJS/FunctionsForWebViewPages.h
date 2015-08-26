//
//  FunctionForWebViewPages.h
//  zjcmcc
//
//  Created by 周中广 on 15/5/13.
//  Copyright (c) 2015年 sjyyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface FunctionsForWebViewPages : NSObject

@property(nonatomic, retain) NSString * strCallBack;
@property(nonatomic, retain) UIWebView * webView;
@property(nonatomic, retain) ViewController * webVC;

- (void)performSelectorWithObject:(NSDictionary*)dict;

//提供给JS调用的函数
- (void)function1ForJS:(NSDictionary *)argument;
- (void)function2ForJS:(NSDictionary *)argument;
- (void)function3ForJS:(NSDictionary *)argument;

@end
