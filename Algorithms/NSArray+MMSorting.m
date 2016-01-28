//
//  NSArray+MMSorting.m
//  Algorithms
//
//  Created by Mike MacDougall on 1/27/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "NSArray+MMSorting.h"

@implementation NSArray (MMSorting)
- (NSArray *)sortedArrayWithType:(MMSortType)type {
    switch (type) {
        case MMSortTypeMerge:
            return [self mergeSort];
        case MMSortTypeQuick:
            return [self quickSort];
        default:
            return nil;
    }
}

#pragma mark - Merge Sort O(n) = n(log(n))
- (NSArray *)mergeSort {
    if (self.count < 2) {
        return self;
    }
    
    NSInteger middlePivot = self.count/2;
    NSRange rangeLeft = NSMakeRange(0, middlePivot);
    NSRange rangeRight = NSMakeRange(middlePivot, self.count-middlePivot);
    NSArray *leftArray = [self subarrayWithRange:rangeLeft];
    NSArray *rightArray = [self subarrayWithRange:rangeRight];
    
    return [[leftArray mergeSort] mergeWithArray:[rightArray mergeSort]];
}

- (NSArray *)mergeWithArray:(NSArray *)rightArray {
    NSMutableArray *orderedArray = [NSMutableArray array];
    NSInteger indexLeft = 0;
    NSInteger indexRight = 0;
    
    while(indexLeft < self.count && indexRight < rightArray.count) {
        if ([self[indexLeft] intValue] < [rightArray[indexRight] intValue]) {
            [orderedArray addObject:self[indexLeft++]];
        } else if ([self[indexLeft] intValue] > [rightArray[indexRight] intValue]) {
            [orderedArray addObject:rightArray[indexRight++]];
        } else {
            [orderedArray addObject:self[indexLeft++]];
            [orderedArray addObject:rightArray[indexRight++]];
        }
    }
    
    NSRange rangeRestLeft = NSMakeRange(indexLeft, self.count - indexLeft);
    NSRange rangeRestRight = NSMakeRange(indexRight, rightArray.count - indexRight);
    NSArray *arrayTotalRight = [rightArray subarrayWithRange:rangeRestRight];
    NSArray *arrayTotalLeft = [self subarrayWithRange:rangeRestLeft];
    arrayTotalLeft = [orderedArray arrayByAddingObjectsFromArray:arrayTotalLeft];
    return [arrayTotalLeft arrayByAddingObjectsFromArray:arrayTotalRight];
}

#pragma mark - Quick Sort
- (NSArray *)quickSort {
    NSMutableArray *lessArray = [NSMutableArray array];
    NSMutableArray *greaterArray = [NSMutableArray array];
    if(self.count < 1) {
        return nil;
    }
    
    NSInteger randomPivot = arc4random() % self.count;
    id pivotValue = self[randomPivot];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([obj intValue] < [pivotValue intValue]) {
            [lessArray addObject:obj];
        } else if([obj intValue] > [pivotValue intValue]) {
            [greaterArray addObject:obj];
        }
    }];
    
    NSMutableArray *sortedArray = [NSMutableArray array];
    [sortedArray addObjectsFromArray:[lessArray quickSort]];
    [sortedArray addObject:pivotValue];
    [sortedArray addObjectsFromArray:[greaterArray quickSort]];
    return sortedArray;
}
@end
