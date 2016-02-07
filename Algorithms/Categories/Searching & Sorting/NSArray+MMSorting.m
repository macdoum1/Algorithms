//
//  NSArray+MMSorting.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/27/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "NSArray+MMSorting.h"

#import "NSArray+MMFunctional.h"

@implementation NSArray (MMSorting)
- (NSArray *)sortedArrayWithType:(MMSortType)type {
    switch (type) {
        case MMSortTypeMerge:
            return [self mergeSort];
        case MMSortTypeQuick:
            return [self quickSort];
        case MMSortTypeInsertion:
            return [self insertionSort];
        case MMSortTypeBucket:
            return [self bucketSort];
        default:
            return nil;
    }
}

- (BOOL)isSorted {
    __block BOOL isSorted = YES;
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSUInteger nextIndex = idx+1;
        if(nextIndex < self.count) {
            id nextObj = self[nextIndex];
            NSComparisonResult comparison = [obj compare:nextObj];
            if(comparison == NSOrderedDescending) {
                isSorted = NO;
                *stop = YES;
            }
        }
    }];
    
    return isSorted;
}

#pragma mark - Merge Sort O(n) = n(log(n))
- (NSArray *)mergeSort {
    if (self.count < 2) {
        return self;
    }
    
    NSUInteger middlePivot = self.count/2;
    NSRange rangeLeft = NSMakeRange(0, middlePivot);
    NSRange rangeRight = NSMakeRange(middlePivot, self.count-middlePivot);
    NSArray *leftArray = [self subarrayWithRange:rangeLeft];
    NSArray *rightArray = [self subarrayWithRange:rangeRight];
    
    return [[leftArray mergeSort] mergeWithArray:[rightArray mergeSort]];
}

- (NSArray *)mergeWithArray:(NSArray *)rightArray {
    NSMutableArray *orderedArray = [NSMutableArray array];
    NSUInteger indexLeft = 0;
    NSUInteger indexRight = 0;
    
    while(indexLeft < self.count && indexRight < rightArray.count) {
        NSComparisonResult comparison = [self[indexLeft] compare:rightArray[indexRight]];
        if (comparison == NSOrderedAscending) {
            [orderedArray addObject:self[indexLeft++]];
        } else if (comparison == NSOrderedDescending) {
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
    
    NSUInteger randomPivot = arc4random() % self.count;
    id pivotValue = self[randomPivot];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSComparisonResult comparison = [obj compare:pivotValue];
        if(comparison == NSOrderedAscending) {
            [lessArray addObject:obj];
        } else if(idx != randomPivot) {
            [greaterArray addObject:obj];
        }
    }];
    
    NSMutableArray *sortedArray = [NSMutableArray array];
    [sortedArray addObjectsFromArray:[lessArray quickSort]];
    [sortedArray addObject:pivotValue];
    [sortedArray addObjectsFromArray:[greaterArray quickSort]];
    return sortedArray;
}

#pragma mark - Insertion Sort
- (NSArray *)insertionSort {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    for(NSUInteger i=1; i < array.count; i++) {
        NSUInteger j = i;
        id target = array[i];
        while(j > 0 && [target compare:array[j-1]] == NSOrderedAscending) {
            [array exchangeObjectAtIndex:j withObjectAtIndex:j-1];
            j--;
        }
    }
    return array;
}

#pragma mark - Bucket Sort
- (NSArray *)bucketSort {
    __block NSInteger minValue = NSIntegerMax;
    __block NSInteger maxValue = NSIntegerMin;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSInteger objVal = [obj intValue];
        if(objVal < minValue) {
            minValue = objVal;
        } else if(objVal > maxValue) {
            maxValue = objVal;
        }
    }];
    
    NSInteger numOfBuckets = maxValue - minValue + 1;
    NSMutableArray <NSMutableArray *> *buckets = [NSMutableArray arrayWithCapacity:numOfBuckets];
    for(NSUInteger i=0; i<numOfBuckets; i++) {
        buckets[i] = [NSMutableArray array];
    }
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSInteger objVal = [obj intValue];
        [buckets[(objVal - minValue)] addObject:obj];
    }];
    
    return [buckets flattenArray];
}
@end
