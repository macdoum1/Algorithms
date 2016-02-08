//
//  MMFactorialTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/2/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSNumber+MMFactorial.h"

@interface MMFactorialTests : XCTestCase

@end

@implementation MMFactorialTests

- (void)testFourFactorial {
    NSNumber *fourFactorial = [NSNumber nFactorial:4];
    XCTAssert(fourFactorial.integerValue == 24);
}

#pragma mark - Iterative
- (void)testIterativeOneFactorial {
    NSNumber *fourFactorial = [NSNumber nFactorialIterative:1];
    XCTAssert(fourFactorial.integerValue == 1);
}

- (void)testIterativeTwoFactorial {
    NSNumber *fourFactorial = [NSNumber nFactorialIterative:2];
    XCTAssert(fourFactorial.integerValue == 2);
}

- (void)testIterativeThreeFactorial {
    NSNumber *fourFactorial = [NSNumber nFactorialIterative:3];
    XCTAssert(fourFactorial.integerValue == 6);
}

- (void)testIterativeFourFactorial {
    NSNumber *fourFactorial = [NSNumber nFactorialIterative:4];
    XCTAssert(fourFactorial.integerValue == 24);
}




@end
