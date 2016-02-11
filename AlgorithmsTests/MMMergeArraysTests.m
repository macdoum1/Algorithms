//
//  MMMergeArraysTests.m
//  MMAlgorithms
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

- (void)testMergeArraysLarger {
    NSArray *arrays = @[@[@10, @20, @30, @40],
                        @[@15, @25, @35, @45],
                        @[@27, @29, @37, @48],
                        @[@32, @33, @39, @50]];
    NSArray *mergedArray = [NSArray mergeArrays:arrays];
    NSArray *targetArray = @[@10, @15, @20, @25, @27, @29, @30, @32, @33, @35, @37, @39, @40, @45, @48, @50];
    XCTAssertEqualObjects(mergedArray, targetArray);
}

@end
