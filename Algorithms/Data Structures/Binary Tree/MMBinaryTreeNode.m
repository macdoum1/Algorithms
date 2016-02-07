//
//  MMBinaryTreeNode.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMBinaryTreeNode.h"

@implementation MMBinaryTreeNode
+ (instancetype)nodeWithValue:(id)value {
    MMBinaryTreeNode *node = [[MMBinaryTreeNode alloc] init];
    node.value = value;
    return node;
}

- (void)insertNode:(MMBinaryTreeNode *)node {
    if([node.value compare:self.value] == NSOrderedAscending) {
        if(self.leftChild == nil) {
            self.leftChild = node;
        } else {
            [self.leftChild insertNode:node];
        }
    } else {
        if(self.rightChild == nil) {
            self.rightChild = node;
        } else {
            [self.rightChild insertNode:node];
        }
    }
}
@end
