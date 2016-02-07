//
//  MMStack.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMStack.h"

@interface MMStack ()
@property (nonatomic, strong) NSMutableArray *stack;
@end
@implementation MMStack
- (instancetype)init {
    self = [super init];
    if(self) {
        self.stack = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)stack {
    return [[MMStack alloc] init];
}

- (void)push:(id)obj {
    if(obj) {
        [self.stack addObject:obj];
    }
}

- (id)pop {
    id value = self.stack.lastObject;
    if(value) {
        [self.stack removeObjectAtIndex:self.size-1];
    }
    return value;
}

- (id)peek {
    return self.stack[self.size-1];
}

- (NSInteger)size {
    return self.stack.count;
}
@end
