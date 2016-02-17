//
//  MMMaxHeapTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/16/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMMaxHeap.h"

@interface MMMaxHeapTests : XCTestCase

@end

@implementation MMMaxHeapTests

- (void)testSimpleMaxHeap {
    MMMaxHeap *minHeap = [MMMaxHeap heap];
    
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
        [results addObject:[minHeap deleteMax]];
    }
    
    NSArray *target = @[@100, @10, @8, @7, @2, @1, @0, @(-53)];
    XCTAssertEqualObjects(results, target);
}

@end
