//
//  MMSearchTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSArray+MMSearch.h"

static const NSInteger kSequentialNumbersInArray = 10000;
static const NSInteger kNumberToFind = 5000;

@interface MMSearchTests : XCTestCase
@property (nonatomic, strong) NSArray *arrayToSearch;
@end

@implementation MMSearchTests

- (void)setUp {
    [super setUp];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for(NSUInteger i=0; i<kSequentialNumbersInArray; i++) {
        [array addObject:@(i+1)];
    }
    self.arrayToSearch = array;
}

- (void)testIteratorSearch {
    [self measureBlock:^{
        [self testSearchWithType:MMSearchTypeIterator];
    }];
}

- (void)testBinarySearch {
    [self measureBlock:^{
        [self testSearchWithType:MMSearchTypeBinary];
    }];
}

- (void)testHashSearch {
    [self measureBlock:^{
        [self testSearchWithType:MMSearchTypeHash];
    }];
}

- (void)testSearchWithType:(MMSearchType)type {
    NSInteger itemIndex = [self.arrayToSearch searchForObj:[NSNumber numberWithInteger:kNumberToFind] type:type];
    XCTAssert(itemIndex == kNumberToFind-1);
}

@end
