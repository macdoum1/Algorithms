//
//  MMSortTestsTests.m
//  MMSortTestsTests
//
//  Created by Mike MacDougall on 1/27/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSArray+MMSorting.h"
#import "NSArray+MMRandom.h"

static const NSInteger kNumOfElements = 5000;
static const NSInteger kMinValue = 0;
static const NSInteger kMaxValue = 10000;

@interface AlgorithmsTests : XCTestCase
@property (nonatomic, strong) NSArray *unsortedArray;
@end

@implementation AlgorithmsTests

- (void)setUp {
    [super setUp];
    self.unsortedArray = [NSArray randomIntArrayWithSize:kNumOfElements
                                           valuesBetween:kMinValue
                                                      to:kMaxValue];
}

- (NSArray *)cocoaSortedArray {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    return [self.unsortedArray sortedArrayUsingDescriptors:@[sortDescriptor]];
}

- (void)testIsSorted {
    XCTAssert([[self cocoaSortedArray] isSorted]);
}

- (void)testMergeSort {
    [self measureBlock:^{
        [self testSortWithType:MMSortTypeMerge];
    }];
}

- (void)testQuickSort {
    [self measureBlock:^{
        [self testSortWithType:MMSortTypeQuick];
    }];
}

- (void)testInsertionSort {
    [self measureBlock:^{
        [self testSortWithType:MMSortTypeInsertion];
    }];
}

- (void)testBucketSort {
    [self measureBlock:^{
        [self testSortWithType:MMSortTypeBucket];
    }];
}

- (void)testSortWithType:(MMSortType)type {
    NSArray *sortedArrayToTest = [self.unsortedArray sortedArrayWithType:type];
    XCTAssert([sortedArrayToTest isEqualToArray:[self cocoaSortedArray]]);
}

@end
