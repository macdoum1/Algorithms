//
//  MMIntervalInsertion.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/21/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMIntervalInsertion.h"

#import "MMStack.h"

@implementation MMIntervalInsertion
+ (NSArray <NSValue *> *)insertInterval:(NSRange)interval intoIntervals:(NSArray <NSValue *> *)intervals {
    NSMutableArray <NSValue *> *intervalsToReturn = [NSMutableArray arrayWithArray:intervals];
    [intervalsToReturn addObject:[NSValue valueWithRange:interval]];    
    return [self mergeRanges:intervalsToReturn];
}

+ (NSArray <NSValue *> *)mergeRanges:(NSArray <NSValue *> *)ranges {
    ranges = [ranges sortedArrayUsingComparator:^NSComparisonResult(NSValue *obj1, NSValue *obj2) {
        NSComparisonResult result = NSOrderedSame;
        if(obj1.rangeValue.location < obj2.rangeValue.location) {
            result = NSOrderedAscending;
        } else if(obj1.rangeValue.location > obj2.rangeValue.location) {
            result = NSOrderedDescending;
        }
        return result;
    }];
    
    MMStack *stack = [MMStack stack];
    [stack push:ranges.firstObject];
    for(NSInteger i=1; i<ranges.count; i++) {
        NSValue *stackValue = [stack peek];
        NSRange rangeFromStack = stackValue.rangeValue;
        NSRange currentRange = ranges[i].rangeValue;
        if(NSIntersectionRange(rangeFromStack, currentRange).length == 0) {
            [stack push:[NSValue valueWithRange:currentRange]];
        } else {
            [stack pop];
            NSRange newRange = NSUnionRange(rangeFromStack, currentRange);
            [stack push:[NSValue valueWithRange:newRange]];
        }
    }
    
    NSMutableArray *merged = [NSMutableArray array];
    while(stack.size > 0) {
        [merged addObject:[stack pop]];
    }
    return [[merged reverseObjectEnumerator] allObjects];
}

@end
