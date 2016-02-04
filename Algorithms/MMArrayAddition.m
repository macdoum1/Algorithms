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
    NSInteger lastColSum = array.lastObject.integerValue + integer;
    if(lastColSum < kMMArrayAdditionBase) {
        if(array.count > 0) {
            NSMutableArray *mutArray = [NSMutableArray arrayWithArray:array];
            mutArray[mutArray.count - 1] = @(lastColSum);
            return mutArray;
        } else {
            return @[@(lastColSum)];
        }
    }
    
    NSInteger lastColVal = lastColSum % kMMArrayAdditionBase;
    NSInteger carry = (lastColSum - lastColVal)/kMMArrayAdditionBase;
    
    NSInteger subarrayLength = array.count > 0 ? array.count-1 : 0;
    NSArray *subarray = [array subarrayWithRange:NSMakeRange(0, subarrayLength)];
    NSMutableArray *arrayToReturn = [NSMutableArray arrayWithArray:[self addInteger:carry
                                                                            toArray:subarray]];
    [arrayToReturn addObject:@(lastColVal)];
    return arrayToReturn;
}
@end
