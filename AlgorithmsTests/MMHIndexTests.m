//
//  MMHIndexTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/19/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMHIndex.h"

@interface MMHIndexTests : XCTestCase

@end

@implementation MMHIndexTests

- (void)testHIndex {
    NSArray *citations = @[@3, @0, @6, @1, @5];
    NSInteger hIndex = [MMHIndex hIndexForCitations:citations];
    XCTAssert(hIndex == 3);
}

@end
