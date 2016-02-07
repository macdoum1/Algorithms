//
//  MMSubarrayUtility.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/2/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMSubarrayUtility.h"

#import "NSArray+MMSorting.h"

@implementation MMSubarrayUtility
#pragma mark - Subarray With Sum
+ (NSArray <NSNumber *> *)subArrayOfArray:(NSArray <NSNumber *> *)array
                                  withSum:(NSNumber *)number {
    for(NSInteger windowSize = 1; windowSize <= array.count; windowSize++) {
        NSInteger numOfWindows = array.count - windowSize + 1;
        for(NSInteger currentWindow = 0; currentWindow<numOfWindows; currentWindow++) {
            NSArray *subArrayToTest = [array subarrayWithRange:NSMakeRange(currentWindow, windowSize)];
            NSInteger subArraySum = [self sumArray:subArrayToTest];
            if(subArraySum == number.integerValue) {
                return subArrayToTest;
            }
        }
    }
    
    return nil;
}

+ (NSInteger)sumArray:(NSArray <NSNumber *> *)array {
    NSInteger sum = 0;
    for(NSNumber *number in array) {
        sum += number.integerValue;
    }
    return sum;
}

#pragma mark - Longest increasing subarray
+ (NSInteger)lengthOfLongestIncreasingSubarray:(NSArray *)array {
    BOOL inefficient = NO;
    if(inefficient) {
        NSInteger maxWindowSize = 0;
        for(NSInteger windowSize = 1; windowSize < array.count; windowSize++) {
            NSInteger numOfWindows = array.count - windowSize + 1;
            for(NSInteger currentWindow = 0; currentWindow < numOfWindows; currentWindow++) {
                NSRange subarrayRange = NSMakeRange(currentWindow, windowSize);
                NSArray *subarray = [array subarrayWithRange:subarrayRange];
                if([self arrayIncreasing:subarray]) {
                    maxWindowSize = windowSize;
                }
            }
        }
        return maxWindowSize;
    } else {
        NSInteger lengthOfLongestIncreasingSubarray = NSIntegerMin;
        NSInteger previousValue = [array.firstObject integerValue];
        NSInteger lengthOfCurrentIncreasingSubarray = 1;
        for(NSInteger i=1; i<array.count; i++) {
            if([array[i] integerValue] > previousValue) {
                lengthOfCurrentIncreasingSubarray++;
            } else {
                lengthOfCurrentIncreasingSubarray = 1;
            }
            previousValue = [array[i] integerValue];
            
            if(lengthOfCurrentIncreasingSubarray > lengthOfLongestIncreasingSubarray) {
                lengthOfLongestIncreasingSubarray = lengthOfCurrentIncreasingSubarray;
            }
            
        }
        
        return lengthOfLongestIncreasingSubarray;
    }
}

+ (BOOL)arrayIncreasing:(NSArray *)array {
    __block BOOL isIncreasing = YES;
    [array enumerateObjectsUsingBlock:^(id  _Nonnull value, NSUInteger idx, BOOL * _Nonnull stop) {
        if(idx+1 < array.count) {
            id nextValue = array[idx+1];
            if([value compare:nextValue] != NSOrderedAscending) {
                isIncreasing = NO;
                *stop = YES;
            }
        }
    }];
    return isIncreasing;
}

#pragma mark - Elements whose sum totals
+ (NSArray <NSNumber *> *)findThreeElementsInArray:(NSArray <NSNumber *> *)array
                                    whoseSumEquals:(NSInteger)sum {
    BOOL inefficient = NO;
    if(inefficient) {
        for(NSInteger i=0; i<array.count-2; i++) {
            for(NSInteger j=i+1; j<array.count-1; j++) {
                for(NSInteger k=j+1; k<array.count; k++) {
                    if(array[i].integerValue + array[j].integerValue + array[k].integerValue == sum) {
                        return @[array[i], array[j], array[k]];
                    }
                }
            }
        }
    } else {
        NSArray <NSNumber *> *sortedArray = [array sortedArrayWithType:MMSortTypeQuick];
        for(NSInteger i=0; i<sortedArray.count-2; i++) {
            NSInteger left = i+1;
            NSInteger right = sortedArray.count-1;
            
            while (left < right) {
                NSInteger sumOfCurrentElements = sortedArray[i].integerValue + sortedArray[left].integerValue + sortedArray[right].integerValue;
                if(sumOfCurrentElements == sum) {
                    return @[sortedArray[i], sortedArray[left], sortedArray[right]];
                } else if(sumOfCurrentElements < sum) {
                    left++;
                } else {
                    right--;
                }
            }
        }
    }
    return nil;
}

+ (NSArray <NSNumber *> *)subarrayIndiciesWithLeastAverage:(NSArray <NSNumber *> *)array size:(NSInteger)size {
    if(array.count < size) {
        return nil;
    }
    
    NSInteger startIndex = 0;
    
    NSInteger leastSum = 0;
    for(NSInteger i=0; i<size; i++) {
        leastSum += array[i].integerValue;
    }
    
    NSInteger currentSum = leastSum;
    for(NSInteger i=size; i<array.count; i++) {
        currentSum += array[i].integerValue - array[i-1].integerValue;
        if(currentSum < leastSum) {
            leastSum = currentSum;
            startIndex = i;
        }
    }
    
    return [array subarrayWithRange:NSMakeRange(startIndex, size)];
}

+ (NSArray <NSNumber *> *)tripletsFromArray:(NSArray <NSNumber *> *)array whoseSumIsLessThan:(NSInteger)lessThan {
    NSArray <NSNumber *> *sorted = [array sortedArrayWithType:MMSortTypeQuick];
    NSMutableArray *triplets = [NSMutableArray array];
    for(NSInteger i=0; i<sorted.count-2; i++) {
        NSInteger left = i+1;
        NSInteger right = sorted.count-1;
        while(left<right) {
            NSInteger sum = sorted[i].integerValue + sorted[left].integerValue + sorted[right].integerValue;
            if(sum < lessThan) {
                [triplets addObject:@[sorted[i], sorted[left], sorted[right]]];
                left++;
            } else {
                right--;
            }
        }
    }
    return triplets;
}
@end
