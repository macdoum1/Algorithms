//
//  MMMergeArraysTests.m
//  Algorithms
//
//  Created by Mike MacDougall on 2/4/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSArray+MMMerge.h"

@interface MMMergeArraysTests : XCTestCase

@end

@implementation MMMergeArraysTests

- (void)testMergeArrays {
    NSArray *arrays = @[@[@1, @2, @3], @[@1, @4, @6], @[@4, @10, @20]];
    NSArray *mergedArray = [NSArray mergeArrays:arrays];
    NSArray *targetArray = @[@1, @1, @2, @3, @4, @4, @6, @10, @20];
    XCTAssertEqualObjects(mergedArray, targetArray);
}

@end
