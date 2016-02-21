//
//  MMIntervalInsertion.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/21/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMIntervalInsertion.h"

@implementation MMIntervalInsertion
+ (NSArray <NSValue *> *)insertInterval:(NSRange)interval intoIntervals:(NSArray <NSValue *> *)intervals {
    NSMutableArray <NSValue *> *intervalsToReturn = [NSMutableArray arrayWithArray:intervals];
    
    for(NSInteger i=0; i<intervals.count; i++) {
        NSRange currentRange = intervalsToReturn[i].rangeValue;
        NSRange intersection = NSIntersectionRange(currentRange, interval);
        if(intersection.length > 0) {
            NSRange newRange = NSUnionRange(currentRange, interval);
            intervalsToReturn[i] = [NSValue valueWithRange:newRange];
        }
    }
    
    return [self mergeRanges:intervalsToReturn];
}

+ (NSArray <NSValue *> *)mergeRanges:(NSArray <NSValue *> *)ranges {
    if(ranges.count < 2) {
        return ranges;
    }
    
    NSRange lastRange = ranges.lastObject.rangeValue;
    NSRange secondLastRange = ranges[ranges.count-2].rangeValue;
    
    NSMutableArray *results = [NSMutableArray array];
    NSRange newRange = NSUnionRange(lastRange, secondLastRange);
    
    if(NSIntersectionRange(lastRange, secondLastRange).length > 0) {
        NSMutableArray *arraysToMerge = [NSMutableArray array];
        NSArray *head = [ranges subarrayWithRange:NSMakeRange(0, ranges.count-2)];
        [arraysToMerge addObjectsFromArray:head];
        [arraysToMerge addObject:[NSValue valueWithRange:newRange]];
        [results addObjectsFromArray:[self mergeRanges:arraysToMerge]];
    } else {
        NSArray *head = [ranges subarrayWithRange:NSMakeRange(0, ranges.count-1)];
        [results addObjectsFromArray:[self mergeRanges:head]];
        [results addObject:[NSValue valueWithRange:lastRange]];
    }
    
    return results;
}

@end
