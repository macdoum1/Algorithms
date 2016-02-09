//
//  MMBinaryTree.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^MMBinaryTreeMapAction)(id obj);

@interface MMBinaryTree : NSObject
- (void)insertValue:(id)value;
- (NSArray *)preOrderTraversal;
- (NSArray *)postOrderTraversal;
- (NSArray *)inOrderTraversal;
- (BOOL)isValidBinaryTree;
- (NSArray *)iterateToLevel:(NSInteger)toLevel;
- (NSArray *)valuesByLevel;
- (BOOL)isBinaryTreeComplete;
- (NSArray <NSArray *> *)levelOrder;
- (NSArray <NSNumber *> *)integerAverageOfEachLevel;
- (void)treeMap:(MMBinaryTreeMapAction)mapAction;
@end
