//
//  MMRandomNumberTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSNumber+MMRandom.h"

@interface MMRandomNumberTests : XCTestCase

@end

@implementation MMRandomNumberTests

- (void)testRandomNumberWithDifferingValues {
    NSInteger from = 1;
    NSInteger to = 5;
    NSNumber *randNum = [NSNumber randomIntBetween:from to:to];
    XCTAssert(randNum.integerValue >= from && randNum.integerValue <= to);
}

- (void)testRandomNumberWithSameValues {
    NSInteger toAndFrom = 5;
    NSNumber *randNum = [NSNumber randomIntBetween:toAndFrom to:toAndFrom];
    XCTAssert(randNum.integerValue == toAndFrom);
}

- (void)testRandomNumberWithZeros {
    NSInteger zero = 0;
    NSNumber *randNum = [NSNumber randomIntBetween:zero to:zero];
    XCTAssert(randNum.integerValue == zero);
}

- (void)testRandomNumberWithNegativeValues {
    NSInteger from = -10;
    NSInteger to = -3;
    NSNumber *randNum = [NSNumber randomIntBetween:from to:to];
    XCTAssert(randNum.integerValue >= from && randNum.integerValue <= to);
}

@end
