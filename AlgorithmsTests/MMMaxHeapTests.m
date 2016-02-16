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
        [results addObject:[minHeap deleteMax]];
    }
    
    NSArray *target = @[@100, @10, @8, @7, @2, @1, @0, @(-53)];
    XCTAssertEqualObjects(results, target);
}

@end
