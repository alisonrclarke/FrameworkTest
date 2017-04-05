//
//  TestTests.m
//  TestTests
//
//  Created by Andrew Polkinghorn on 05/04/2017.
//  Copyright © 2017 Test. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestPrinter.h"

@interface TestTests : XCTestCase

@end

@implementation TestTests

- (void)testExample {
    NSString *expected = @"Hello World!";
    NSString *observed = [[TestPrinter new] text];
    XCTAssertEqualObjects(expected, observed);
}

@end
