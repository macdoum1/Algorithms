//
//  MMMatrixRotationTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/21/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMMatrixRotation.h"

@interface MMMatrixRotationTests : XCTestCase

@end

@implementation MMMatrixRotationTests

- (void)testTwoByTwoRotation {
    NSArray <NSArray *> *matrix = @[@[@1, @2],
                                    @[@3, @4]];
    NSArray <NSArray *> *rotatedMatrix = [MMMatrixRotation rotateMatrix:matrix];
    NSArray <NSArray *> *targetMatrix = @[@[@3, @1],
                                          @[@4, @2]];
    XCTAssertEqualObjects(rotatedMatrix, targetMatrix);
}

- (void)testThreeByThreeRotation {
    NSArray <NSArray *> *matrix = @[@[@1, @2, @3],
                                    @[@4, @5, @6],
                                    @[@7, @8, @9]];
    NSArray <NSArray *> *rotatedMatrix = [MMMatrixRotation rotateMatrix:matrix];
    NSArray <NSArray *> *targetMatrix = @[@[@7, @4, @1],
                                          @[@8, @5, @2],
                                          @[@9, @6, @3]];
    XCTAssertEqualObjects(rotatedMatrix, targetMatrix);
}

@end
