//
//  TestPrinter.m
//  Test
//
//  Created by Andrew Polkinghorn on 05/04/2017.
//  Copyright © 2017 Test. All rights reserved.
//

#import "TestPrinter.h"

@implementation TestPrinter

-(NSString *)text {
    NSString *text = @"Hello World!";
    NSLog(@"%@", text);
    return text;
}

-(NSString*)version {
    return [NSString stringWithFormat:@"Version: %s", TEST_FRAMEWORK_VERSION];
}

@end
