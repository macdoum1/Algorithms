//
//  MMPriorityQueueTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/18/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMPriorityQueue.h"

@interface MMPriorityQueueTests : XCTestCase

@end

@implementation MMPriorityQueueTests

- (void)testPushAndPop {
    MMPriorityQueue <NSNumber *> *queue = [MMPriorityQueue queue];
    [queue push:@5];
    [queue push:@3];
    [queue push:@1];
    [queue push:@8];
    
    NSMutableArray *results = [NSMutableArray array];
    while(!queue.isEmpty) {
        [results addObject:queue.pop];
    }
    
    NSArray *target = @[@1, @3, @5, @8];
    XCTAssertEqualObjects(results, target);
}

@end
