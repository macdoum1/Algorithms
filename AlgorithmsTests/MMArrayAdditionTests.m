//
//  MMArrayAdditionTests.m
//  Algorithms
//
//  Created by Mike MacDougall on 2/3/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMArrayAddition.h"

@interface MMArrayAdditionTests : XCTestCase

@end

@implementation MMArrayAdditionTests
/*
 
 @[@1, @2, @8] + 2 = @[@1, @3, @0]
 
*/
- (void)testArrayAdditionOneCarry {
    NSArray *array = @[@1, @2, @8];
    NSArray *sumArray = [MMArrayAddition addInteger:2 toArray:array];
    NSArray *targetArray = @[@1, @3, @0];
    XCTAssertEqualObjects(sumArray, targetArray);
}

/*
 
 @[@1, @8, @8] + 4 = @[@1, @9, @2]
 
 */
- (void)testArrayAdditionTwoCarry {
    NSArray *array = @[@1, @8, @8];
    NSArray *sumArray = [MMArrayAddition addInteger:4 toArray:array];
    NSArray *targetArray = @[@1, @9, @2];
    XCTAssertEqualObjects(sumArray, targetArray);
}

/*
 
 @[@9, @9, @9] + 1 = @[@1, @0, @0, @0]
 
 */
- (void)testArrayAdditionThreeCarry {
    NSArray *array = @[@9, @9, @9];
    NSArray *sumArray = [MMArrayAddition addInteger:1 toArray:array];
    NSArray *targetArray = @[@1, @0, @0, @0];
    XCTAssertEqualObjects(sumArray, targetArray);
}

/*
 
 @[@9, @9, @9] + 10000 = @[@1, @0, @9, @9, @9]
 
 */
- (void)testArrayAdditionOverCarry {
    NSArray *array = @[@9, @9, @9];
    NSArray *sumArray = [MMArrayAddition addInteger:10000 toArray:array];
    NSArray *targetArray = @[@1, @0, @9, @9, @9];
    XCTAssertEqualObjects(sumArray, targetArray);
}

@end
