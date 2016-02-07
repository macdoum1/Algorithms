//
//  MMQueueTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMQueue.h"

@interface MMQueueTests : XCTestCase

@end

@implementation MMQueueTests

- (void)testPush {
    MMQueue *queue = [MMQueue queue];
    [queue push:@3];
    [queue push:@2];
    [queue push:@1];
    
    XCTAssert(queue.size == 3);
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[queue pop]];
    [values addObject:[queue pop]];
    [values addObject:[queue pop]];
    NSArray *targetArray = @[@3, @2, @1];
    XCTAssertEqualObjects(values, targetArray);
    
}

- (void)testPop {
    MMQueue *queue = [MMQueue queue];
    [queue push:@3];
    [queue push:@2];
    [queue push:@1];
    
    [queue pop];
    
    XCTAssert(queue.size == 2);
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[queue pop]];
    [values addObject:[queue pop]];
    NSArray *targetArray = @[@2, @1];
    XCTAssertEqualObjects(values, targetArray);
}

- (void)testPeek {
    MMQueue *queue = [MMQueue queue];
    [queue push:@3];
    [queue push:@2];
    [queue push:@1];
    
    XCTAssert(queue.size == 3);
    XCTAssertEqualObjects([queue peek], @3);
    XCTAssert(queue.size == 3);
}

@end
