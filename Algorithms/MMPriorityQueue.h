//
//  MMPriorityQueue.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/18/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMPriorityQueue <ObjectType> : NSObject
+ (instancetype)queue;
- (void)push:(ObjectType)obj;
- (ObjectType)pop;
- (ObjectType)peek;
- (BOOL)isEmpty;
@end
