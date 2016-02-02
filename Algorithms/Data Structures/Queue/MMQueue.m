//
//  MMQueue.m
//  Algorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMQueue.h"

@interface MMQueue ()
@property (nonatomic, strong) NSMutableArray *queue;
@end
@implementation MMQueue
- (instancetype)init {
    self = [super init];
    if(self) {
        self.queue = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)queue {
    return [[MMQueue alloc] init];
}

- (void)push:(id)obj {
    if(obj) {
        [self.queue addObject:obj];
    }
}

- (id)pop {
    id value = self.queue.firstObject;
    if(value) {
        [self.queue removeObjectAtIndex:0];
    }
    return value;
}

- (id)peek {
    return self.queue.firstObject;
}

- (NSInteger)size {
    return self.queue.count;
}
@end
