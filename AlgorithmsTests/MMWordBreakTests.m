//
//  MMWordBreakTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/19/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSString+MMWordBreak.h"

@interface MMWordBreakTests : XCTestCase

@end

@implementation MMWordBreakTests

- (void)testWordBreakWholeWord {
    NSString *string = @"waterfall";
    BOOL segmented = [string stringCouldBeSegmentedIntoWordsFromDictionary:@[@"waterfall"]];
    XCTAssert(segmented);
}

- (void)testWordBreakBothParts {
    NSString *string = @"waterfall";
    BOOL segmented = [string stringCouldBeSegmentedIntoWordsFromDictionary:@[@"water", @"fall"]];
    XCTAssert(segmented);
}

- (void)testWordBreakOnlyOnePart {
    NSString *string = @"waterfall";
    BOOL segmented = [string stringCouldBeSegmentedIntoWordsFromDictionary:@[@"water"]];
    XCTAssert(!segmented);
}

- (void)testWordBreakEmptyDictionary {
    NSString *string = @"waterfall";
    BOOL segmented = [string stringCouldBeSegmentedIntoWordsFromDictionary:@[]];
    XCTAssert(!segmented);
}

@end
