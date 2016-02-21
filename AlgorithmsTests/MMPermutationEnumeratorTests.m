//
//  MMPermutationEnumeratorTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/21/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMPermutationEnumerator.h"

@interface MMPermutationEnumeratorTests : XCTestCase

@end

@implementation MMPermutationEnumeratorTests

- (void)testPermutationEnumerator {
    NSArray *array = @[@1, @2, @3];
    MMPermutationEnumerator *enumerator = [MMPermutationEnumerator enumeratorWithArray:array];
    
    NSMutableArray *perms = [NSMutableArray array];
    for(id obj in enumerator) {
        [perms addObject:obj];
    }
    
    NSArray *target = @[@[@1, @3, @2],
                        @[@2, @1, @3],
                        @[@2, @3, @1],
                        @[@3, @1, @2],
                        @[@3, @2, @1]];
    XCTAssertEqualObjects(perms, target);
}

@end
