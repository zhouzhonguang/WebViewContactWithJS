//
//  FunctionForWebViewPages.m
//  zjcmcc
//
//  Created by 周中广 on 15/5/13.
//  Copyright (c) 2015年 sjyyt. All rights reserved.
//

#import "FunctionsForWebViewPages.h"

#import <MessageUI/MessageUI.h>

#import "AppDelegate.h"

@interface FunctionsForWebViewPages ()

@end

@implementation FunctionsForWebViewPages

- (void)performSelectorWithObject:(NSDictionary*)dict{
    NSString * functionName = [dict objectForKey:@"function"];//函数名
    NSDictionary * argumentDic = [dict objectForKey:@"argument"];//参数－－同服务端json参数
    self.strCallBack = [dict objectForKey:@"callback"];//回调函数名
    if ([self respondsToSelector:sel_registerName([functionName UTF8String])]) {
        [self performSelector:sel_registerName([functionName UTF8String]) withObject:argumentDic];
    }
}

#pragma mark -
#pragma mark - UIWebView Private
-(NSString *)evalJs:(NSString *)strJs{
    //回调JS
    NSString *result = [self.webView stringByEvaluatingJavaScriptFromString:strJs];
    return result;
}

- (void)function1ForJS:(NSDictionary *)argument{
    //完成JS需要的功能
    
    //如果JS需要回传参数，则使用strCallBack回传参数
}

- (void)function2ForJS:(NSDictionary *)argument{
    //完成JS需要的功能
    
    //如果JS需要回传参数，则使用strCallBack回传参数
}

- (void)function3ForJS:(NSDictionary *)argument{
    //完成JS需要的功能
    
    //如果JS需要回传参数，则使用strCallBack回传参数
}
@end
