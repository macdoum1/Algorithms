//
//  MMBinaryTree.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMBinaryTree.h"
#import "MMBinaryTreeNode.h"
#import "NSArray+MMSorting.h"

@interface MMBinaryTree ()
@property (nonatomic, strong) MMBinaryTreeNode *root;
@end
@implementation MMBinaryTree

- (void)insertValue:(id)value {
    MMBinaryTreeNode *newNode = [MMBinaryTreeNode nodeWithValue:value];
    if(!self.root) {
        self.root = newNode;
    } else {
        [self.root insertNode:newNode];
    }
}

#pragma mark - Preorder Traversal
- (NSArray *)preOrderTraversal {
    if(self.root) {
        return [self preOrderTraversalRecursive:self.root];
    }
    return @[];
}

- (NSArray *)preOrderTraversalRecursive:(MMBinaryTreeNode *)node {
    NSMutableArray *values = [NSMutableArray array];
    if(node) {
        [values addObject:node.value];
        [values addObjectsFromArray:[self preOrderTraversalRecursive:node.leftChild]];
        [values addObjectsFromArray:[self preOrderTraversalRecursive:node.rightChild]];
    }
    return values;
}

#pragma mark - Postorder Traversal
- (NSArray *)postOrderTraversal {
    if(self.root) {
        return [self postOrderTraversalRecursive:self.root];
    }
    return @[];
}

- (NSArray *)postOrderTraversalRecursive:(MMBinaryTreeNode *)node {
    NSMutableArray *values = [NSMutableArray array];
    if(node) {
        [values addObjectsFromArray:[self postOrderTraversalRecursive:node.leftChild]];
        [values addObjectsFromArray:[self postOrderTraversalRecursive:node.rightChild]];
        [values addObject:node.value];
    }
    return values;
}

#pragma mark - In Order Traversal
- (NSArray *)inOrderTraversal {
    if(self.root) {
        return [self inOrderTraversalRecursive:self.root];
    }
    return @[];
}

- (NSArray *)inOrderTraversalRecursive:(MMBinaryTreeNode *)node {
    NSMutableArray *values = [NSMutableArray array];
    if(node) {
        [values addObjectsFromArray:[self inOrderTraversalRecursive:node.leftChild]];
        [values addObject:node.value];
        [values addObjectsFromArray:[self inOrderTraversalRecursive:node.rightChild]];
    }
    return values;
}

- (BOOL)isValidBinaryTree {
    __block BOOL isValid = YES;
    NSArray *array = [self inOrderTraversal];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull value, NSUInteger idx, BOOL * _Nonnull stop) {
        if(idx+1 < array.count) {
            id nextValue = array[idx+1];
            if([value compare:nextValue] != NSOrderedAscending) {
                isValid = NO;
                *stop = YES;
            }
        }
    }];
    
    return isValid;
}

- (NSArray *)iterateToLevel:(NSInteger)toLevel {
    return [self iterateToLevel:toLevel node:self.root currentLevel:0];
}

- (NSArray *)iterateToLevel:(NSInteger)toLevel node:(MMBinaryTreeNode *)node currentLevel:(NSInteger)currentLevel {
    NSMutableArray *nodes = [NSMutableArray array];
    if(toLevel == currentLevel) {
        [nodes addObject:node.value];
    } else {
        [nodes addObjectsFromArray:[self iterateToLevel:toLevel
                                                   node:node.leftChild
                                           currentLevel:currentLevel+1]];
        [nodes addObjectsFromArray:[self iterateToLevel:toLevel
                                                   node:node.rightChild
                                           currentLevel:currentLevel+1]];
        
    }
    return nodes;
}

- (NSArray *)valuesByLevel {
    NSDictionary *dict = [self valuesByLevel:self.root currentLevel:0];
    NSArray *sortedKeys = [dict.allKeys sortedArrayWithType:MMSortTypeQuick];
    NSMutableArray *valuesByLevel = [NSMutableArray array];
    [sortedKeys enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
        [valuesByLevel addObject:dict[key]];
    }];
    return valuesByLevel;
}

- (NSDictionary *)valuesByLevel:(MMBinaryTreeNode *)node currentLevel:(NSInteger)currentLevel {
    if(!node) {
        return @{};
    }
    
    NSDictionary *levels = @{@(currentLevel): @[node.value]};
    levels = [self mergeTwoDictionaries:levels dict2:[self valuesByLevel:node.leftChild currentLevel:currentLevel+1]];
    levels = [self mergeTwoDictionaries:levels dict2:[self valuesByLevel:node.rightChild currentLevel:currentLevel+1]];
    return levels;
}

- (NSDictionary *)mergeTwoDictionaries:(NSDictionary <NSNumber *, NSArray *> *)dict1
                                 dict2:(NSDictionary <NSNumber *, NSArray *> *)dict2 {
    NSMutableSet *keysFromBoth = [NSMutableSet set];
    [keysFromBoth addObjectsFromArray:dict1.allKeys];
    [keysFromBoth addObjectsFromArray:dict2.allKeys];
    
    NSMutableDictionary *mergedDictionary = [NSMutableDictionary dictionary];
    [keysFromBoth enumerateObjectsUsingBlock:^(NSNumber *key, BOOL *stop) {
        NSMutableArray *values = [NSMutableArray array];
        if(dict1[key]) {
            [values addObjectsFromArray:dict1[key]];
        }
        
        if(dict2[key]) {
            [values addObjectsFromArray:dict2[key]];
        }
        
        mergedDictionary[key] = values;
    }];
    
    
    return mergedDictionary;
}

@end
