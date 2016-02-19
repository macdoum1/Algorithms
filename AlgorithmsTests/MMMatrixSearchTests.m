//
//  MMMatrixSearchTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/18/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMMatrixSearch.h"

@interface MMMatrixSearchTests : XCTestCase

@end

@implementation MMMatrixSearchTests

- (void)testMatrixSearchFound {
    NSArray *matrix = @[@[@1, @2, @3],
                        @[@4, @5, @6],
                        @[@9, @10, @12]];
    MMMatrixSearchResult *result = [MMMatrixSearch indexOfObject:@6 inMatrix:matrix];
    XCTAssert([result.row isEqual:@1] && [result.col isEqual:@2]);
}

@end
