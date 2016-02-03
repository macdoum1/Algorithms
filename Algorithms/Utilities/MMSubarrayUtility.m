//
//  MMSubarrayUtility.m
//  Algorithms
//
//  Created by Mike MacDougall on 2/2/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMSubarrayUtility.h"

@implementation MMSubarrayUtility
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

+ (NSInteger)lengthOfLongestIncreasingSubarray:(NSArray *)array {
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
@end
