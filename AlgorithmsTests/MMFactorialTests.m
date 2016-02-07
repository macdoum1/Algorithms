//
//  MMFactorialTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/2/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSNumber+MMFactorial.h"

@interface MMFactorialTests : XCTestCase

@end

@implementation MMFactorialTests

- (void)testFourFactorial {
    NSNumber *fourFactorial = [NSNumber nFactorial:4];
    XCTAssert(fourFactorial.integerValue == 24);
}


@end
