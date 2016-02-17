//
//  MMMaxHeap.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/16/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMMaxHeap : NSObject
+ (instancetype)heap;
- (void)insertObject:(id)object;
- (id)deleteMax;
- (BOOL)isEmpty;
@end
