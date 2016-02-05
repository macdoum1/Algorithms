//
//  MMMaximumStockProfitTests.m
//  Algorithms
//
//  Created by Mike MacDougall on 2/4/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMMaximumStockProfit.h"

@interface MMMaximumStockProfitTests : XCTestCase

@end

@implementation MMMaximumStockProfitTests

- (void)testMaximumProfit {
    NSArray *stockOverTime = @[[NSDecimalNumber numberWithDouble:2.15],
                               [NSDecimalNumber numberWithDouble:5.23],
                               [NSDecimalNumber numberWithDouble:1.00],
                               [NSDecimalNumber numberWithDouble:4.91],
                               [NSDecimalNumber numberWithDouble:8.01],
                               [NSDecimalNumber numberWithDouble:10.99],
                               [NSDecimalNumber numberWithDouble:3.32],
                               [NSDecimalNumber numberWithDouble:4.92]];
    NSArray *buySell = [MMMaximumStockProfit buySellForMaxProfit:stockOverTime];
    XCTAssertEqualObjects(buySell.firstObject, @2);
    XCTAssertEqualObjects(buySell.lastObject, @5);
}

@end
