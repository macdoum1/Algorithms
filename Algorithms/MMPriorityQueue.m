//
//  MMPriorityQueue.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/18/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMPriorityQueue.h"

@interface MMPriorityQueue ()
@property (nonatomic, strong) NSMutableArray *queue;
@end
@implementation MMPriorityQueue
+ (instancetype)queue {
    return [[MMPriorityQueue alloc] init];
}

- (instancetype)init {
    self = [super init];
    if(self) {
        self.queue = [NSMutableArray array];
    }
    return self;
}

- (void)push:(id)obj {
    NSUInteger idx = [self.queue indexOfObject:obj inSortedRange:NSMakeRange(0, self.queue.count) options:NSBinarySearchingInsertionIndex usingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    [self.queue insertObject:obj atIndex:idx];
}

- (id)pop {
    id obj = self.queue.firstObject;
    if(obj) {
        [self.queue removeObjectAtIndex:0];
    }
    return obj;
}

- (id)peek {
    return self.queue.firstObject;
}

- (BOOL)isEmpty {
    return self.queue.count == 0;
}
@end
