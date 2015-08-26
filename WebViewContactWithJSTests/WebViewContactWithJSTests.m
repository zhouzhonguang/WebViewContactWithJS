//
//  WebViewContactWithJSTests.m
//  WebViewContactWithJSTests
//
//  Created by 周中广 on 15/8/25.
//  Copyright (c) 2015年 周中广. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface WebViewContactWithJSTests : XCTestCase

@end

@implementation WebViewContactWithJSTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    
    NSLog(@"1");
    
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
    
    __block int a = 0;
    void (^foo) (void) = ^{
        a = 1;
    };
    
    foo();
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
