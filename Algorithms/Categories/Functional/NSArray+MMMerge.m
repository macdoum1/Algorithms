//
//  NSArray+MMMerge.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/4/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "NSArray+MMMerge.h"

@implementation NSArray (MMMerge)
+ (NSArray *)mergeArrays:(NSArray <NSArray *> *)arrays {
    if(arrays.count < 2) {
        return arrays.firstObject;
    }
    
    NSArray *leftArray = arrays[arrays.count - 2];
    NSArray *rightArray = arrays.lastObject;
    
    NSMutableArray *mergedLastTwoArrays = [NSMutableArray array];
    NSInteger leftIdx = 0;
    NSInteger rightIdx = 0;
    while(leftIdx < leftArray.count && rightIdx < rightArray.count) {
        NSComparisonResult result = [leftArray[leftIdx] compare:rightArray[rightIdx]];
        if(result == NSOrderedAscending) {
            [mergedLastTwoArrays addObject:leftArray[leftIdx++]];
        } else if(result == NSOrderedDescending) {
            [mergedLastTwoArrays addObject:rightArray[rightIdx++]];
        } else {
            [mergedLastTwoArrays addObject:leftArray[leftIdx++]];
            [mergedLastTwoArrays addObject:rightArray[rightIdx++]];
        }
    }
    
    NSArray *leftRemaining = [leftArray subarrayWithRange:NSMakeRange(leftIdx, leftArray.count - leftIdx)];
    NSArray *rightRemaining = [rightArray subarrayWithRange:NSMakeRange(rightIdx, rightArray.count - rightIdx)];
    [mergedLastTwoArrays addObjectsFromArray:leftRemaining];
    [mergedLastTwoArrays addObjectsFromArray:rightRemaining];
    
    NSMutableArray *arraysRemaining = [NSMutableArray array];
    [arraysRemaining addObjectsFromArray:[arrays subarrayWithRange:NSMakeRange(0, arrays.count - 2)]];
    [arraysRemaining addObject:mergedLastTwoArrays];

    return [self mergeArrays:arraysRemaining];
}
@end
