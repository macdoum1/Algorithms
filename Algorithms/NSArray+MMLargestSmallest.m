//
//  NSArray+MMLargestSmallest.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/10/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "NSArray+MMLargestSmallest.h"

@implementation NSArray (MMLargestSmallest)
- (id)nthLargestValue:(NSInteger)n {
    NSArray *sorted = [self sortedArrayUsingSelector:@selector(compare:)];
    NSInteger idx = (self.count - 1) - n;
    if(idx < sorted.count && idx >= 0) {
        return sorted[idx];
    } else {
        return nil;
    }
}

- (id)nthSmallestValue:(NSInteger)n {
    NSArray *sorted = [self sortedArrayUsingSelector:@selector(compare:)];
    if(n < sorted.count && n >= 0) {
        return sorted[n];
    } else {
        return nil;
    }
}
@end
