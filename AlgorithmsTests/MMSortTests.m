//
//  MMSortTestsTests.m
//  MMSortTestsTests
//
//  Created by Mike MacDougall on 1/27/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSArray+MMSorting.h"

@interface AlgorithmsTests : XCTestCase
@property (nonatomic, strong) NSArray *sortedArray;
@property (nonatomic, strong) NSArray *unsortedArray;
@end

@implementation AlgorithmsTests

- (void)setUp {
    [super setUp];
    self.unsortedArray = @[@100, @1, @250, @24, @89, @200, @65, @175, @189];
    self.sortedArray = @[@1, @24, @65, @89, @100, @175, @189, @200, @250];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testMergeSort {
    [self testSortWithType:MMSortTypeMerge];
}

- (void)testQuickSort {
    [self testSortWithType:MMSortTypeQuick];
}

- (void)testSortWithType:(MMSortType)type {
    NSArray *sortedArray = [self.unsortedArray sortedArrayWithType:type];
    XCTAssertEqualObjects(sortedArray, self.sortedArray);
}

@end
