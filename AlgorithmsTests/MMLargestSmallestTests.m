//
//  MMLargestSmallestTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/10/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSArray+MMLargestSmallest.h"

@interface MMLargestSmallestTests : XCTestCase

@end

@implementation MMLargestSmallestTests
// 1 2 4 5 6 8

#pragma mark - Largest
- (void)testNthLargestValueZero {
    NSArray *array = @[@2, @5, @1, @6, @4, @8];
    XCTAssertEqualObjects([array nthLargestValue:0], @(8));
}

- (void)testNthLargestValueMiddle {
    NSArray *array = @[@2, @5, @1, @6, @4, @8];
    XCTAssertEqualObjects([array nthLargestValue:3], @(4));
}

- (void)testNthLargestValueEnd {
    NSArray *array = @[@2, @5, @1, @6, @4, @8];
    XCTAssertEqualObjects([array nthLargestValue:5], @(1));
}

#pragma mark - Smallest
- (void)testNthSmallestValueZero {
    NSArray *array = @[@2, @5, @1, @6, @4, @8];
    XCTAssertEqualObjects([array nthSmallestValue:0], @(1));
}

- (void)testNthSmallestValueMiddle {
    NSArray *array = @[@2, @5, @1, @6, @4, @8];
    XCTAssertEqualObjects([array nthSmallestValue:3], @(5));
}

- (void)testNthSmallestValueEnd {
    NSArray *array = @[@2, @5, @1, @6, @4, @8];
    XCTAssertEqualObjects([array nthSmallestValue:5], @(8));
}

@end
