//
//  MMBinaryTreeNode.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMBinaryTreeNode : NSObject
@property (nonatomic, strong) id value;
@property (nonatomic, strong) MMBinaryTreeNode *leftChild;
@property (nonatomic, strong) MMBinaryTreeNode *rightChild;
+ (instancetype)nodeWithValue:(id)value;
- (void)insertNode:(MMBinaryTreeNode *)node;
@end
