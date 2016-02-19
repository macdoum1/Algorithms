//
//  MMSequenceFormerTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/11/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMSequenceFormer.h"

@interface MMSequenceFormerTests : XCTestCase

@end

@implementation MMSequenceFormerTests

- (void)testIncreasingDecreasingOnlyDecrease {
    NSString *sequence = [MMSequenceFormer increasingDecreasingSequenceForSequence:@"D"];
    NSString *target = @"21";
    XCTAssertEqualObjects(sequence, target);
}

- (void)testIncreasingDecreasingOnlyIncrease {
    NSString *sequence = [MMSequenceFormer increasingDecreasingSequenceForSequence:@"I"];
    NSString *target = @"12";
    XCTAssertEqualObjects(sequence, target);
}

- (void)testIncreasingDecreasingMultipleDecreasing {
    NSString *sequence = [MMSequenceFormer increasingDecreasingSequenceForSequence:@"DDD"];
    NSString *target = @"4321";
    XCTAssertEqualObjects(sequence, target);
}

- (void)testIncreasingDecreasingMultipleIncreasing {
    NSString *sequence = [MMSequenceFormer increasingDecreasingSequenceForSequence:@"III"];
    NSString *target = @"1234";
    XCTAssertEqualObjects(sequence, target);
}

//- (void)testEvenSplit {
//    NSString *sequence = [MMSequenceFormer increasingDecreasingSequenceForSequence:@"DDDIII"];
//    NSString *target = @"4321234";
//    XCTAssertEqualObjects(sequence, target);
//}
//
//- (void)testEvenSplitVariantTwo {
//    NSString *sequence = [MMSequenceFormer increasingDecreasingSequenceForSequence:@"IIIDDD"];
//    NSString *target = @"1234321";
//    XCTAssertEqualObjects(sequence, target);
//}
//
//- (void)testMixed {
//    NSString *sequence = [MMSequenceFormer increasingDecreasingSequenceForSequence:@"IIDIDII"];
//    NSString *target = @"12323234";
//    XCTAssertEqualObjects(sequence, target);
//}


@end
