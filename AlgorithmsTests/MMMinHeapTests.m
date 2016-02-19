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
    
    [minHeap insertObject:@2];
    [minHeap insertObject:@10];
    [minHeap insertObject:@1];
    [minHeap insertObject:@8];
    [minHeap insertObject:@7];
    [minHeap insertObject:@(-53)];
    [minHeap insertObject:@100];
    [minHeap insertObject:@0];
    
    NSMutableArray *results = [NSMutableArray array];
    while(!minHeap.isEmpty) {
        [results addObject:[minHeap deleteMin]];
    }
    
    NSArray *target = @[@(-53), @0, @1, @2, @7, @8, @10, @100];
    XCTAssertEqualObjects(results, target);
    
}

- (void)testGetMin {
    MMMinHeap *minHeap = [MMMinHeap heap];
    
    [minHeap insertObject:@2];
    [minHeap insertObject:@10];
    [minHeap insertObject:@1];
    [minHeap insertObject:@8];
    [minHeap insertObject:@7];
    [minHeap insertObject:@(-53)];
    [minHeap insertObject:@100];
    [minHeap insertObject:@0];
    
    XCTAssertEqualObjects([minHeap getMin], @(-53));
}

@end
