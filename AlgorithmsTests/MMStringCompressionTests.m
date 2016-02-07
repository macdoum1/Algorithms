//
//  MMStringCompressionTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/4/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSString+MMCompression.h"

@interface MMStringCompressionTests : XCTestCase

@end

@implementation MMStringCompressionTests

- (void)testStringCompression {
    NSString *string = @"aaabbccdddd";
    NSString *compressed = [string compressedString];
    NSString *targetString = @"a3b2c2d4";
    XCTAssertEqualObjects(compressed, targetString);
}

- (void)testStringCompressionWithSingleChars {
    NSString *string = @"abbccdd";
    NSString *compressed = [string compressedString];
    NSString *targetString = @"ab2c2d2";
    XCTAssertEqualObjects(compressed, targetString);
}

@end
