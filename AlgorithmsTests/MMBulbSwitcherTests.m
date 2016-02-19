//
//  MMBulbSwitcherTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/19/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMBulbSwitcher.h"

@interface MMBulbSwitcherTests : XCTestCase

@end

@implementation MMBulbSwitcherTests

- (void)test3BulbSwitcher {
    NSInteger bulbsOn = [MMBulbSwitcher numberOfBulbsOnFromTotal:3];
    XCTAssert(bulbsOn == 1);
}

- (void)test5BulbSwitcher {
    NSInteger bulbsOn = [MMBulbSwitcher numberOfBulbsOnFromTotal:10];
    XCTAssert(bulbsOn == 5);
    // 1 1 1 1 1 1 1 1 1 1 // First Round
    // 0 1 2 3 4 5 6 7 8 9
    //
    // 1 0 1 0 1 0 1 0 1 0 // Second Round
    //
    // 1 0 1 0 1 1 1 0 0 1 // Third Round
}

@end
