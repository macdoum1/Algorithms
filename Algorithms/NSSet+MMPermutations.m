//
//  NSSet+MMPermutations.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/21/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "NSSet+MMPermutations.h"


@implementation NSSet (MMPermutations)
- (NSSet <NSArray *> *)permutations {
    return [self permutationsWithSize:self.count];
}

- (NSSet <NSArray *> *)permutationsWithSize:(NSInteger)size {
    NSMutableSet <NSArray *> *permutations = [NSMutableSet set];
    if(size == 1) {
        for(id obj in self) {
            [permutations addObject:@[obj]];
        }
        return permutations;
    }
    for(id obj in self) {
        NSMutableSet *tail = [NSMutableSet setWithSet:self];
        [tail removeObject:obj];
        
        NSSet *permutationsInTail = [tail permutationsWithSize:size-1];
        for(NSArray *tailPermutation in permutationsInTail) {
            NSMutableArray *permutationsToAdd = [@[obj] mutableCopy];
            [permutationsToAdd addObjectsFromArray:tailPermutation];
            [permutations addObject:permutationsToAdd];
        }
    }
    
    
    return permutations;
}
@end
