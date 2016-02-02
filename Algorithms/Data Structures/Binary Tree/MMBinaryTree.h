//
//  MMBinaryTree.h
//  Algorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMBinaryTree : NSObject
- (void)insertValue:(id)value;
- (NSArray *)preOrderTraversal;
- (NSArray *)postOrderTraversal;
- (NSArray *)inOrderTraversal;
@end
