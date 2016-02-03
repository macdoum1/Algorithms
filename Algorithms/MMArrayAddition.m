//
//  MMArrayAddition.m
//  Algorithms
//
//  Created by Mike MacDougall on 2/3/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMArrayAddition.h"
/*

 @[1,2,8] + 20
 
*/

/*
 
 @[9,9,9] + 1
 
 */

static const NSInteger kMMArrayAdditionBase = 10;

@implementation MMArrayAddition
+ (NSArray <NSNumber *> *)addInteger:(NSInteger)integer
                             toArray:(NSArray <NSNumber *> *)array {
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:array];
    NSInteger lastColSum = array.lastObject.integerValue + integer;
    if(lastColSum < kMMArrayAdditionBase) {
        if(mutArray.count > 0) {
            mutArray[mutArray.count - 1] = [NSNumber numberWithInteger:lastColSum];
        } else {
            [mutArray addObject:[NSNumber numberWithInteger:lastColSum]];
        }
        return mutArray;
    }
    
    NSInteger lastColVal = lastColSum % kMMArrayAdditionBase;
    NSInteger carryRemaining = lastColSum - lastColVal;
    NSInteger carryToAdd = carryRemaining/kMMArrayAdditionBase;
    
    NSArray *subarray;
    if(array.count > 0) {
    subarray = [array subarrayWithRange:NSMakeRange(0, array.count-1)];
    } else {
        subarray = @[];
    }
    NSMutableArray *arrayToReturn = [NSMutableArray arrayWithArray:[self addInteger:carryToAdd toArray:subarray]];
    [arrayToReturn addObject:@(lastColVal)];
    return arrayToReturn;
}
@end
