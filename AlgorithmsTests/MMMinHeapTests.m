//
//  MMMinHeapTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/16/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMMinHeap.h"

@interface MMMinHeapTests : XCTestCase

@end

@implementation MMMinHeapTests

- (void)testSimpleMinHeap {
    MMMinHeap *minHeap = [MMMinHeap heap];
    
    [minHeap insertNumber:@2];
    [minHeap insertNumber:@10];
    [minHeap insertNumber:@1];
    [minHeap insertNumber:@8];
    [minHeap insertNumber:@7];
    [minHeap insertNumber:@(-53)];
    [minHeap insertNumber:@100];
    [minHeap insertNumber:@0];
    
    NSMutableArray *results = [NSMutableArray array];
    while(!minHeap.isEmpty) {
        [results addObject:[minHeap deleteMin]];
    }
    
    NSArray *target = @[@(-53), @0, @1, @2, @7, @8, @10, @100];
    XCTAssertEqualObjects(results, target);
}

@end
