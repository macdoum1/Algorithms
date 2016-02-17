//
//  MMMinHeap.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/16/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMMinHeap.h"

@interface MMMinHeap ()
@property (nonatomic, strong) NSMutableArray *heap;
@end
@implementation MMMinHeap
+ (instancetype)heap {
    MMMinHeap *heap = [[MMMinHeap alloc] init];
    return heap;
}

- (instancetype)init {
    self = [super init];
    if(self) {
        self.heap = [NSMutableArray array];
        [self.heap insertObject:@(NSIntegerMin) atIndex:0];
    }
    return self;
}

- (void)insertObject:(id)obj {
    [self.heap addObject:obj];
    for(NSInteger i=self.heap.count-1; [obj doubleValue] < [self.heap[i/2] doubleValue]; i /= 2) {
        [self.heap exchangeObjectAtIndex:i withObjectAtIndex:i/2];
    }
}

- (id)deleteMin {
    if(self.isEmpty) {
        return nil;
    }
    
    NSInteger child, i;
    
    NSNumber *minNum = [self.heap[1] copy];
    NSNumber *lastNum = self.heap.lastObject;
    for(i=1; i*2 <= self.heap.count-1; i = child) {
        child = i * 2;
        if(child != self.heap.count-1 && [self.heap[child+1] doubleValue] < [self.heap[child] doubleValue]) {
            child++;
        }
        
        if([lastNum doubleValue] > [self.heap[child] doubleValue]) {
            [self.heap exchangeObjectAtIndex:i withObjectAtIndex:child];
        } else {
            break;
        }
    }
    [self.heap replaceObjectAtIndex:i withObject:lastNum];
    [self.heap removeLastObject];
    return minNum;
}

- (BOOL)isEmpty {
    return self.heap.count < 2;
}
@end
