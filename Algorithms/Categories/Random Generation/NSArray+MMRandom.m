//
//  NSArray+MMRandom.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "NSArray+MMRandom.h"

#import "NSNumber+MMRandom.h"

@implementation NSArray (MMRandom)
+ (instancetype)randomIntArrayWithSize:(NSInteger)size
                         valuesBetween:(NSInteger)from
                                    to:(NSInteger)to  {
    NSMutableArray *array = [NSMutableArray array];
    for(NSInteger i = 0; i < size; i++) {
        [array addObject:[NSNumber randomIntBetween:from to:to]];
    }
    return array;
}

@end
