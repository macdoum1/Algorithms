//
//  MMNearbyWordsTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/29/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+MMNearbyWords.h"

@interface MMNearbyWordsTests : XCTestCase

@end

@implementation MMNearbyWordsTests

- (void)setUp {
    [super setUp];
}

- (void)testCharacterStringsInWord {
    NSString *testString = @"gi";
    NSArray <NSString *> *characterStrings = [testString characterStringsInWord];
    NSArray *targetArray = @[@"g", @"i"];
    XCTAssertEqualObjects(characterStrings, targetArray);
}

- (void)testNearbyWords {
    NSString *testString = @"gi";
    NSArray <NSString *> *nearbyWords = [testString nearbyWords];
    NSArray *targetArray = @[@"hi", @"fi", @"go"];
    XCTAssertEqualObjects(nearbyWords, targetArray);
}

- (void)testNearbyWordsWithEmptyString {
    NSString *testString = @"";
    NSArray <NSString *> *nearbyWords = [testString nearbyWords];
    NSArray *targetArray = @[];
    XCTAssertEqualObjects(nearbyWords, targetArray);
}

- (void)testSample {
    NSString *string = ({
        NSString *testString = @"test";
        testString;
    });
    
    XCTAssertEqualObjects(string, @"test");
}

@end
