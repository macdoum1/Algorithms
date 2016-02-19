//
//  MMMinHeap.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/16/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMMinHeap <__covariant ObjectType> : NSObject
+ (instancetype)heap;
- (void)insertObject:(ObjectType)obj;
- (ObjectType)getMin;
- (ObjectType)deleteMin;
- (BOOL)isEmpty;
@end
