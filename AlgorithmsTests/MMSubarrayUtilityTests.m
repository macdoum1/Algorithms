//
//  MMSubarrayUtilityTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/2/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMSubarrayUtility.h"

@interface MMSubarrayUtilityTests : XCTestCase

@end

@implementation MMSubarrayUtilityTests

#pragma mark - Subarray With Sum
- (void)testSubArrayLengthOneWithSum {
    NSArray *array = @[@2, @15, @2, @3, @100];
    NSArray *subArrayWithSum = [MMSubarrayUtility subArrayOfArray:array withSum:@15];
    NSArray *targetArray = @[@15];
    XCTAssertEqualObjects(subArrayWithSum, targetArray);
}

- (void)testSubArrayLengthTwoWithSum {
    NSArray *array = @[@2, @15, @2, @3, @100];
    NSArray *subArrayWithSum = [MMSubarrayUtility subArrayOfArray:array withSum:@5];
    NSArray *targetArray = @[@2, @3];
    XCTAssertEqualObjects(subArrayWithSum, targetArray);
}

- (void)testSubArrayLengthThreeWithSum {
    NSArray *array = @[@2, @15, @2, @3, @100];
    NSArray *subArrayWithSum = [MMSubarrayUtility subArrayOfArray:array withSum:@105];
    NSArray *targetArray = @[@2, @3, @100];
    XCTAssertEqualObjects(subArrayWithSum, targetArray);
}

- (void)testNoSubArrayWithSum {
    NSArray *array = @[@2, @15, @2, @3, @100];
    NSArray *subArrayWithSum = [MMSubarrayUtility subArrayOfArray:array withSum:@18];
    XCTAssertEqualObjects(subArrayWithSum, nil);
}

#pragma mark - Longest increasing subarray
- (void)testLengthOfLongestIncreasingSubarray {
    NSArray *array = @[@4, @1, @3, @2, @100, @101, @102, @103, @89];
    NSInteger longestIncreasingSubarrayLength = [MMSubarrayUtility lengthOfLongestIncreasingSubarray:array];
    XCTAssert(longestIncreasingSubarrayLength == 5);
}

- (void)testLongestIncreasingSubarray {
    NSArray *array = @[@4, @1, @3, @2, @100, @101, @102, @103, @89, @1, @2, @3];
    NSArray *longestIncreasing = [MMSubarrayUtility longestIncreasingSubarray:array];
    NSArray *targetArray = @[@2, @100, @101, @102, @103];
    XCTAssertEqualObjects(longestIncreasing, targetArray);
}

#pragma mark - Elements whose sum totals
- (void)testThreeElementsWhoseSumTotals {
    NSArray *array = @[@(-1), @3, @11, @(-10), @(5)];
    NSSet *threeElements = [NSSet setWithArray:[MMSubarrayUtility findThreeElementsInArray:array whoseSumEquals:0]];
    NSSet *targetArray = [NSSet setWithArray:@[@(-1), @11, @(-10)]];
    XCTAssertEqualObjects(threeElements, targetArray);
}

#pragma mark - Subarray with least average
- (void)testSubarrayWithLeastAverage {
    NSArray *array = @[@1, @10, @11, @50, @2, @3, @14];
    NSArray *subarray = [MMSubarrayUtility subarrayIndiciesWithLeastAverage:array size:3];
    NSArray *targetArray = @[@2, @3, @14];
    XCTAssertEqualObjects(subarray, targetArray);
}

#pragma mark - Triplets from array with sum less than
- (void)testTriplesFromArrayWithSumLessThan {
    NSArray *array = @[@1, @2, @1, @3, @10, @3];
    NSArray *triplets = [MMSubarrayUtility tripletsFromArray:array whoseSumIsLessThan:7];
    NSArray *targetTriplets = @[@[@1, @1, @3], @[@1, @2, @3], @[@1, @2, @3]];
    XCTAssertEqualObjects(triplets, targetTriplets);
}

#pragma mark - Pairs from array with sum equal to
- (void)testPairsFromArrayWithSum {
    NSArray *array = @[@5, @5, @3, @100, @7, @3];
    NSArray *pairs = [MMSubarrayUtility allPairsFromArray:array whoseSumEquals:10 useDictionary:NO];
    NSArray *target = @[@[@3, @7], @[@3, @7], @[@5, @5]];
    XCTAssertEqualObjects(pairs, target);
}

- (void)testPairsFromArrayWithSumUsingDictionary {
    NSArray *array = @[@5, @5, @3, @100, @7, @3];
    NSArray *pairs = [MMSubarrayUtility allPairsFromArray:array whoseSumEquals:10 useDictionary:YES];
    NSArray *target = @[@[@3, @7], @[@3, @7], @[@5, @5]];
    //XCTAssertEqualObjects(pairs, target);
}

@end
