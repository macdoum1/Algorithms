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
    NSMutableArray *values = [NSMutableArray array];
    if(self.root) {
        [self preOrderTraversalRecursive:self.root values:values];
    }
    return values;
}

- (void)preOrderTraversalRecursive:(MMBinaryTreeNode *)node values:(NSMutableArray *)values {
    if(node) {
        [values addObject:node.value];
        [self preOrderTraversalRecursive:node.leftChild values:values];
        [self preOrderTraversalRecursive:node.rightChild values:values];
    }
}

#pragma mark - Postorder Traversal
- (NSArray *)postOrderTraversal {
    NSMutableArray *values = [NSMutableArray array];
    if(self.root) {
        [self postOrderTraversalRecursive:self.root values:values];
    }
    return values;
}

- (void)postOrderTraversalRecursive:(MMBinaryTreeNode *)node values:(NSMutableArray *)values {
    if(node) {
        [self postOrderTraversalRecursive:node.leftChild values:values];
        [self postOrderTraversalRecursive:node.rightChild values:values];
        [values addObject:node.value];
    }
}

#pragma mark - In Order Traversal
- (NSArray *)inOrderTraversal {
    NSMutableArray *values = [NSMutableArray array];
    if(self.root) {
        [self inOrderTraversalRecursive:self.root values:values];
    }
    return values;
}

- (void)inOrderTraversalRecursive:(MMBinaryTreeNode *)node values:(NSMutableArray *)values {
    if(node) {
        [self inOrderTraversalRecursive:node.leftChild values:values];
        [values addObject:node.value];
        [self inOrderTraversalRecursive:node.rightChild values:values];
    }
}
@end
