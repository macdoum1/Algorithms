//
//  MMStackTests.m
//  Algorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMStack.h"

@interface MMStackTests : XCTestCase

@end

@implementation MMStackTests


- (void)testPush {
    MMStack *stack = [MMStack stack];
    [stack push:@3];
    [stack push:@2];
    [stack push:@1];
    
    XCTAssert(stack.size == 3);
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[stack pop]];
    [values addObject:[stack pop]];
    [values addObject:[stack pop]];
    NSArray *targetArray = @[@1, @2, @3];
    
    XCTAssertEqualObjects(values, targetArray);
}

- (void)testPop {
    MMStack *stack = [MMStack stack];
    [stack push:@3];
    [stack push:@2];
    [stack push:@1];
    
    [stack pop];
    
    XCTAssert(stack.size == 2);
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[stack pop]];
    [values addObject:[stack pop]];
    NSArray *targetArray = @[@2, @3];
    
    XCTAssertEqualObjects(values, targetArray);
}

- (void)testPeek {
    MMStack *stack = [MMStack stack];
    [stack push:@3];
    [stack push:@2];
    [stack push:@1];
    
    XCTAssert(stack.size == 3);
    XCTAssertEqualObjects([stack peek], @1);
    XCTAssert(stack.size == 3);
}
@end
