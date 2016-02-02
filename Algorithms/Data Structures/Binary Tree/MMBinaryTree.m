//
//  MMBinaryTree.m
//  Algorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMBinaryTree.h"
#import "MMBinaryTreeNode.h"

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
@end
