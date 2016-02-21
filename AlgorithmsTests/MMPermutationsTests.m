//
//  MMPermutationsTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/21/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSSet+MMPermutations.h"

@interface MMPermutationsTests : XCTestCase

@end

@implementation MMPermutationsTests

- (void)testPermutations {
    NSArray *setArray = @[@"A", @"B", @"C"];
    NSSet *set = [NSSet setWithArray:setArray];
    NSSet *permutations = [set permutations];
    
    NSArray *targetArray = @[@[@"C", @"B", @"A"],
                             @[@"C", @"A", @"B"],
                             @[@"A", @"C", @"B"],
                             @[@"A", @"B", @"C"],
                             @[@"B", @"C", @"A"],
                             @[@"B", @"A", @"C"]];
    NSSet *targetSet = [NSSet setWithArray:targetArray];
    XCTAssertEqualObjects(permutations, targetSet);
}

@end
