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
@property (nonatomic, strong) NSArray *unsortedArray;
@end

@implementation AlgorithmsTests

- (void)setUp {
    [super setUp];
    self.unsortedArray = @[@100, @1, @250, @24, @89, @200, @65, @175, @189];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testIsSorted {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    NSArray *sortedArray = [self.unsortedArray sortedArrayUsingDescriptors:@[sortDescriptor]];
    XCTAssert([sortedArray isSorted]);
}

- (void)testMergeSort {
    [self testSortWithType:MMSortTypeMerge];
}

- (void)testQuickSort {
    [self testSortWithType:MMSortTypeQuick];
}

- (void)testSortWithType:(MMSortType)type {
    NSArray *sortedArray = [self.unsortedArray sortedArrayWithType:type];
    XCTAssert([sortedArray isSorted]);
}

@end
