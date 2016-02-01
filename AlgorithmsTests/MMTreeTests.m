//
//  MMTreeTests.m
//  Algorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMBinaryTree.h"

@interface MMTreeTests : XCTestCase

@end

@implementation MMTreeTests

/*
        8
       / \
      3   11
       \    \
        7   100
 
*/


- (void)testInOrderTraversal {
    MMBinaryTree *tree = [[MMBinaryTree alloc] init];
    
    [tree insertValue:@8];
    [tree insertValue:@3];
    [tree insertValue:@11];
    [tree insertValue:@7];
    [tree insertValue:@100];
    
    NSArray *values = [tree inOrderTraversal];
    NSArray *targetArray = @[@3, @7, @8, @11, @100];
    XCTAssertEqualObjects(values, targetArray);
}

- (void)testPreOrderTraversal {
    MMBinaryTree *tree = [[MMBinaryTree alloc] init];
    
    [tree insertValue:@8];
    [tree insertValue:@3];
    [tree insertValue:@11];
    [tree insertValue:@7];
    [tree insertValue:@100];
    
    NSArray *values = [tree preOrderTraversal];
    NSArray *targetArray = @[@8, @3, @7, @11, @100];
    XCTAssertEqualObjects(values, targetArray);
}

- (void)testPostOrderTraversal {
    MMBinaryTree *tree = [[MMBinaryTree alloc] init];
    
    [tree insertValue:@8];
    [tree insertValue:@3];
    [tree insertValue:@11];
    [tree insertValue:@7];
    [tree insertValue:@100];
    
    NSArray *values = [tree postOrderTraversal];
    NSArray *targetArray = @[@7, @3, @100, @11, @8];
    XCTAssertEqualObjects(values, targetArray);
}

@end
