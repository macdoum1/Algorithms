//
//  NSArray+MMSearch.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "NSArray+MMSearch.h"

@implementation NSArray (MMSearch)
- (NSUInteger)searchForObj:(id)obj type:(MMSearchType)type {
    switch (type) {
        case MMSearchTypeIterator:
            return [self iteratorSearchForObj:obj];
        case MMSearchTypeBinary:
            return [self binarySearchForObj:obj];
        case MMSearchTypeHash:
            return [self hashSearchForObj:obj];
        default:
            return NSNotFound;
    }
}

#pragma mark - Iterator Search
- (NSInteger)iteratorSearchForObj:(id)obj {
    __block NSInteger objIdx = NSNotFound;
    [self enumerateObjectsUsingBlock:^(id arrayObj, NSUInteger idx, BOOL *stop) {
        if([obj isEqual:arrayObj]) {
            objIdx = idx;
            *stop = YES;
        }
    }];
    return objIdx;
}

#pragma mark - Binary Search
- (NSInteger)binarySearchForObj:(id)obj {
    if(obj == nil) {
        return NSNotFound;
    }
    return [self binarySearchForObj:obj min:0 max:self.count-1];
}

- (NSInteger)binarySearchForObj:(id)obj min:(NSInteger)min max:(NSInteger)max {
    if(max < min) {
        return NSNotFound;
    }
    
    NSInteger mid = (min + max)/2;
    id midObj = self[mid];
    NSComparisonResult comparison = [obj compare:midObj];
    if(comparison == NSOrderedSame) {
        return mid;
    } else if(comparison == NSOrderedAscending) {
        return [self binarySearchForObj:obj min:min max:mid-1];
    } else {
        return [self binarySearchForObj:obj min:mid+1 max:max];
    }
}

#pragma mark - Hash Search
- (NSInteger)hashSearchForObj:(id)obj {
    NSMutableDictionary *map = [[NSMutableDictionary alloc] init];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        map[@([obj hash])] = @(idx);
    }];
    
    NSNumber *indexNum = map[@([obj hash])];
    if(!indexNum) {
        return NSNotFound;
    }
    
    return indexNum.integerValue;
}
@end
