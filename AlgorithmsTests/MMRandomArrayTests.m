//
//  MMRandomArrayTests.m
//  Algorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSArray+MMRandom.h"

@interface MMRandomArrayTests : XCTestCase

@end

@implementation MMRandomArrayTests

- (void)testArraySize {
    NSInteger size = 100;
    NSArray *array = [NSArray randomIntArrayWithSize:size valuesBetween:1 to:100];
    XCTAssert(size == array.count);
}

- (void)testArraySizeWithZeroValues {
    NSInteger size = 100;
    NSArray *array = [NSArray randomIntArrayWithSize:size valuesBetween:0 to:0];
    XCTAssert(size == array.count);
}

@end
