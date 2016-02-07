//
//  MMLinkedListTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/2/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMLinkedList.h"

@interface MMLinkedListTests : XCTestCase

@end

@implementation MMLinkedListTests

- (void)testAddValue {
    MMLinkedList *list = [MMLinkedList list];
    [list addValue:@1];
    [list addValue:@2];
    [list addValue:@3];
    
    NSArray *values = [list allValues];
    NSArray *targetArray = @[@1, @2, @3];
    XCTAssertEqualObjects(values, targetArray);
}

- (void)testFindValueWithValue {
    MMLinkedList *list = [MMLinkedList list];
    [list addValue:@1];
    [list addValue:@2];
    [list addValue:@3];
    
    XCTAssert([list findFirstValue:@3]);
}

- (void)testFindValueWithoutValue {
    MMLinkedList *list = [MMLinkedList list];
    [list addValue:@1];
    [list addValue:@2];
    [list addValue:@3];
    
    XCTAssert(![list findFirstValue:@4]);
}

- (void)testRemoveHeadValue {
    MMLinkedList *list = [MMLinkedList list];
    [list addValue:@1];
    [list addValue:@2];
    [list addValue:@3];
    
    XCTAssert([list removeFirstValue:@1]);
    
    NSArray *values = [list allValues];
    NSArray *targetValues = @[@2, @3];
    XCTAssertEqualObjects(values, targetValues);
}

- (void)testRemoveMiddleValue {
    MMLinkedList *list = [MMLinkedList list];
    [list addValue:@1];
    [list addValue:@2];
    [list addValue:@3];
    
    XCTAssert([list removeFirstValue:@2]);
    
    NSArray *values = [list allValues];
    NSArray *targetValues = @[@1, @3];
    XCTAssertEqualObjects(values, targetValues);
}

- (void)testRemoveTailValue {
    MMLinkedList *list = [MMLinkedList list];
    [list addValue:@1];
    [list addValue:@2];
    [list addValue:@3];
    
    XCTAssert([list removeFirstValue:@3]);
    
    NSArray *values = [list allValues];
    NSArray *targetValues = @[@1, @2];
    XCTAssertEqualObjects(values, targetValues);
}

- (void)testRemoveInvalidValue {
    MMLinkedList *list = [MMLinkedList list];
    [list addValue:@1];
    [list addValue:@2];
    [list addValue:@3];
    
    XCTAssert(![list removeFirstValue:@4]);
    
    NSArray *values = [list allValues];
    NSArray *targetValues = @[@1, @2, @3];
    XCTAssertEqualObjects(values, targetValues);
}

- (void)testReverseObjectEnumerator {
    MMLinkedList *list = [MMLinkedList list];
    [list addValue:@"A"];
    [list addValue:@"B"];
    [list addValue:@"C"];
    NSMutableArray *reversedList = [NSMutableArray array];
    [list reverseIterator:^(id value) {
        [reversedList addObject:value];
    }];
    
    NSArray *targetArray = @[@"C", @"B", @"A"];
    XCTAssertEqualObjects(reversedList, targetArray);
}

@end
