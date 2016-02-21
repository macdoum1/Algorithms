//
//  MMTreeTests.m
//  MMAlgorithms
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

- (void)testIsValidBinaryTree {
    MMBinaryTree *tree = [[MMBinaryTree alloc] init];
    
    [tree insertValue:@8];
    [tree insertValue:@3];
    [tree insertValue:@11];
    [tree insertValue:@7];
    [tree insertValue:@100];
    
    XCTAssert([tree isValidBinaryTree]);
}

- (void)testIterateToLevel {
    MMBinaryTree *tree = [[MMBinaryTree alloc] init];
    [tree insertValue:@10];
    [tree insertValue:@7];
    [tree insertValue:@12];
    [tree insertValue:@6];
    [tree insertValue:@8];
    [tree insertValue:@11];
    [tree insertValue:@13];

    NSArray *valuesAtLevelTwo = [tree iterateToLevel:2];
    NSArray *targetArray = @[@6, @8, @11, @13];
    XCTAssertEqualObjects(valuesAtLevelTwo, targetArray);
}

- (void)testValuesByLevel {
    MMBinaryTree *tree = [[MMBinaryTree alloc] init];
    [tree insertValue:@10];
    [tree insertValue:@7];
    [tree insertValue:@12];
    [tree insertValue:@6];
    [tree insertValue:@8];
    [tree insertValue:@11];
    [tree insertValue:@13];
    [tree insertValue:@9];
    
    NSArray *valuesByLevel = [tree valuesByLevel];
    NSArray *targetArray = @[@[@10], @[@7, @12], @[@6, @8, @11, @13], @[@9]];
    XCTAssertEqualObjects(valuesByLevel, targetArray);
}

#pragma mark - Complete Binary Tree
- (void)testTreeComplete {
    MMBinaryTree *tree = [[MMBinaryTree alloc] init];
    [tree insertValue:@5];
    [tree insertValue:@3];
    [tree insertValue:@7];
    [tree insertValue:@1];
    [tree insertValue:@4];
    [tree insertValue:@6];
    [tree insertValue:@8];
    
    BOOL complete = [tree isBinaryTreeComplete];
    
    XCTAssert(complete);
}

- (void)testTreeCompleteVariantTwo {
    MMBinaryTree *tree = [[MMBinaryTree alloc] init];
    [tree insertValue:@5];
    [tree insertValue:@3];
    [tree insertValue:@7];
    [tree insertValue:@1];
    [tree insertValue:@4];
    [tree insertValue:@6];
    
    BOOL complete = [tree isBinaryTreeComplete];
    
    XCTAssert(complete);
}

- (void)testTreeNotComplete {
    MMBinaryTree *tree = [[MMBinaryTree alloc] init];
    [tree insertValue:@5];
    [tree insertValue:@3];
    [tree insertValue:@7];
    [tree insertValue:@4];
    [tree insertValue:@6];
    [tree insertValue:@8];
    
    BOOL complete = [tree isBinaryTreeComplete];
    
    XCTAssert(!complete);
}

- (void)testLevelOrder {
    MMBinaryTree *tree = [[MMBinaryTree alloc] init];
    [tree insertValue:@5];
    [tree insertValue:@3];
    [tree insertValue:@7];
    [tree insertValue:@1];
    [tree insertValue:@4];
    [tree insertValue:@6];
    [tree insertValue:@8];
    
    NSArray *levelOrder = [tree levelOrder];
    NSArray *target = @[@[@5], @[@3, @7], @[@1, @4, @6, @8]];
    XCTAssertEqualObjects(levelOrder, target);
}

- (void)testAveragesForEachLevel {
    MMBinaryTree *tree = [[MMBinaryTree alloc] init];
    [tree insertValue:@5];
    [tree insertValue:@3];
    [tree insertValue:@7];
    [tree insertValue:@1];
    [tree insertValue:@4];
    [tree insertValue:@6];
    [tree insertValue:@8];
    
    NSArray *averages = [tree integerAverageOfEachLevel];
    NSArray *target = @[@5, @5, @4];
    XCTAssertEqualObjects(averages, target);
}

- (void)testTreeMappingFunction {
    MMBinaryTree *tree = [[MMBinaryTree alloc] init];
    [tree insertValue:@5];
    [tree insertValue:@3];
    [tree insertValue:@7];
    [tree insertValue:@1];
    [tree insertValue:@4];
    [tree insertValue:@6];
    [tree insertValue:@8];
    
    [tree treeMap:^NSNumber *(NSNumber *obj) {
        return [NSNumber numberWithInteger:obj.integerValue*2];
    }];
    
    NSArray *inOrder = [tree inOrderTraversal];
    NSArray *target = @[@2, @6, @8, @10, @12, @14, @16];
    XCTAssertEqualObjects(inOrder, target);
}

- (void)testTreeDepth {
    MMBinaryTree *tree = [[MMBinaryTree alloc] init];
    [tree insertValue:@10];
    [tree insertValue:@11];
    [tree insertValue:@12];
    [tree insertValue:@13];
    [tree insertValue:@14];
    [tree insertValue:@15];
    [tree insertValue:@8];
    [tree insertValue:@4];
    [tree insertValue:@2];
    
    NSInteger depth = [tree maxDepth];
    
    XCTAssert(depth == 6);
}

@end
