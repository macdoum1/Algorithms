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
#import "MMQueue.h"

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

- (BOOL)isBinaryTreeComplete {
    if(!self.root) {
        return YES;
    }
    
    MMQueue *queue = [MMQueue queue];
    [queue push:self.root];
    while(queue.size > 0) {
        MMBinaryTreeNode *node = [queue pop];
        if([node isEqual:[NSNull null]]) {
            break;
        }
        
        [queue push:node.leftChild ?: [NSNull null]];
        [queue push:node.rightChild ?: [NSNull null]];
    }
    
    return [[queue arrayRepresentation] indexOfObject:[NSNull null]] != NSNotFound;
}

- (NSArray <NSArray *> *)levelOrder {
    if(!self.root) {
        return @[];
    }
    
    NSMutableArray *levelOrder = [NSMutableArray array];
    NSMutableArray *nodesOnCurrentLevel = [NSMutableArray array];
    
    MMQueue *currentLevel = [MMQueue queue];
    MMQueue *nextLevel = [MMQueue queue];
    
    [currentLevel push:self.root];
    while (currentLevel.size > 0) {
        MMBinaryTreeNode *node = [currentLevel pop];
        [nodesOnCurrentLevel addObject:node.value];
        [nextLevel push:node.leftChild];
        [nextLevel push:node.rightChild];
        
        if(currentLevel.size == 0) {
            [levelOrder addObject:nodesOnCurrentLevel];
            nodesOnCurrentLevel = [NSMutableArray array];
            MMQueue *temp = currentLevel;
            currentLevel = nextLevel;
            nextLevel = temp;
        }
    }
    
    return levelOrder;
}

- (NSArray <NSNumber *> *)integerAverageOfEachLevel {
    NSArray  *levelOrder = [self levelOrder];
    NSMutableArray *averages = [NSMutableArray array];
    for(NSArray *level in levelOrder) {
        NSInteger sum = 0;
        for(id value in level) {
            sum += [value integerValue];
        }
        [averages addObject:@(sum/level.count)];
    }
    return averages;
}

- (void)treeMap:(MMBinaryTreeMapAction)mapAction {
    MMQueue *currentLevel = [MMQueue queue];
    [currentLevel push:self.root];
    while(currentLevel.size > 0) {
        MMBinaryTreeNode *node = [currentLevel pop];
        if(node.value) {
            node.value = mapAction(node.value);
        }
        
        [currentLevel push:node.leftChild];
        [currentLevel push:node.rightChild];
    }
}

@end