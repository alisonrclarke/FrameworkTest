//
//  TestDevTests.m
//  TestDevTests
//
//  Created by Andrew Polkinghorn on 14/04/2017.
//  Copyright © 2017 Test. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestPrinter.h"

@interface TestDevTests : XCTestCase

@end

@implementation TestDevTests

- (void)testExample {
    NSString *expected = @"Hello World!";
    NSString *observed = [[TestPrinter new] text];
    XCTAssertEqualObjects(expected, observed);
}

@end
