//
//  lunbotuTests.m
//  lunbotuTests
//
//  Created by tsc on 17-5-24.
//  Copyright (c) 2017年 eric. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface lunbotuTests : XCTestCase

@end

@implementation lunbotuTests

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
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
