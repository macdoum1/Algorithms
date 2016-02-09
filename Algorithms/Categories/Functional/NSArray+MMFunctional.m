//
//  NSArray+MMFunctional.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "NSArray+MMFunctional.h"

@implementation NSArray (MMFunctional)
#pragma mark - Flatten
- (NSArray *)flattenArray {
    NSMutableArray *array = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([obj isKindOfClass:self.class]) {
            [array addObjectsFromArray:[obj flattenArray]];
        } else {
            [array addObject:obj];
        }
    }];
    
    return array;
}

- (NSArray *)map:(MMFunctionalMapBlock)action {
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id result = action(obj);
        if(result) {
            [array addObject:result];
        }
    }];
    return array;
}

- (NSArray *)arrayByRemovingDuplicates {
    return [[[NSOrderedSet alloc] initWithArray:self] array];
}
@end
