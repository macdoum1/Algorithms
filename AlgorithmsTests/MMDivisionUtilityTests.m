//
//  MMDivisionUtilityTests.m
//  MMAlgorithms
//
//  Created by Michael MacDougall on 2/7/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMDivisionUtility.h"

@interface MMDivisionUtilityTests : XCTestCase

@end

@implementation MMDivisionUtilityTests

- (void)testSimpleDivision {
    NSInteger result = [MMDivisionUtility dividerNumerator:100 denominator:5];
    XCTAssert(result == 20);
}

- (void)testSimpleDivisionWithNegativeNumerator {
    NSInteger result = [MMDivisionUtility dividerNumerator:-100 denominator:5];
    XCTAssert(result == -20);
}

- (void)testSimpleDivisionWithNegativeDenominator {
    NSInteger result = [MMDivisionUtility dividerNumerator:100 denominator:-5];
    XCTAssert(result == -20);
}

- (void)testSimpleDivisionWithBothNegative {
    NSInteger result = [MMDivisionUtility dividerNumerator:-100 denominator:-5];
    XCTAssert(result == 20);
}

- (void)testSimpleDivisionZeroNumerator {
    NSInteger result = [MMDivisionUtility dividerNumerator:0 denominator:100];
    XCTAssert(result == 0);
}

- (void)testSimpleDivisionOneDenominator {
    NSInteger result = [MMDivisionUtility dividerNumerator:100 denominator:1];
    XCTAssert(result == 100);
}

- (void)testUnevenDivision {
    NSInteger result = [MMDivisionUtility dividerNumerator:20 denominator:3];
    XCTAssert(result == 6);
}

- (void)testDivideByZero {
    XCTAssertThrows([MMDivisionUtility dividerNumerator:1 denominator:0]);
}

@end
