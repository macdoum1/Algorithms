//
//  MMIntervalInsertionTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/21/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMIntervalInsertion.h"

@interface MMIntervalInsertionTests : XCTestCase

@end

@implementation MMIntervalInsertionTests

- (void)testSimpleIntervalInsertion {
    NSMutableArray *intervals = [NSMutableArray array];
    [intervals addObject:[NSValue valueWithRange:NSMakeRange(1, 2)]];
    [intervals addObject:[NSValue valueWithRange:NSMakeRange(6, 3)]];
    
    NSArray <NSValue *> *finalIntervals = [MMIntervalInsertion insertInterval:NSMakeRange(2, 3) intoIntervals:intervals];
    
    NSMutableArray *target = [NSMutableArray array];
    [target addObject:[NSValue valueWithRange:NSMakeRange(1, 4)]];
    [target addObject:[NSValue valueWithRange:NSMakeRange(6, 3)]];
    
    XCTAssertEqualObjects(finalIntervals, target);
}

- (void)testLargerIntervalInsertion {
    NSMutableArray *intervals = [NSMutableArray array];
    [intervals addObject:[NSValue valueWithRange:NSMakeRange(1, 1)]];
    [intervals addObject:[NSValue valueWithRange:NSMakeRange(3, 2)]];
    [intervals addObject:[NSValue valueWithRange:NSMakeRange(6, 1)]];
    [intervals addObject:[NSValue valueWithRange:NSMakeRange(8, 2)]];
    [intervals addObject:[NSValue valueWithRange:NSMakeRange(12, 4)]];

    NSArray <NSValue *> *finalIntervals = [MMIntervalInsertion insertInterval:NSMakeRange(4, 5) intoIntervals:intervals];
    
    NSMutableArray *target = [NSMutableArray array];
    [target addObject:[NSValue valueWithRange:NSMakeRange(1, 1)]];
    [target addObject:[NSValue valueWithRange:NSMakeRange(3, 7)]];
    [target addObject:[NSValue valueWithRange:NSMakeRange(12, 4)]];


    XCTAssertEqualObjects(finalIntervals, target);
}

@end
