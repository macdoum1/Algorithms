//
//  MMPermutationEnumerator.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/21/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMPermutationEnumerator.h"

@interface MMPermutationEnumerator ()
@property (nonatomic, copy) NSArray *array;
@end
@implementation MMPermutationEnumerator
+ (instancetype)enumeratorWithArray:(NSArray *)array {
    return [[MMPermutationEnumerator alloc] initWithArray:array];
}

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if(self) {
        self.array = array;
    }
    return self;
}

- (id)nextObject {
    if(self.array.count <= 1) {
        return self.array.firstObject;
    }
    
    NSInteger p = NSNotFound;
    for(NSInteger i=self.array.count-2; i>= 0; i--) {
        if([self.array[i] compare:self.array[i+1]] == NSOrderedAscending) {
            p = i;
            break;
        }
    }
    
    if(p == NSNotFound) {
        return nil;
    }
    
    for(NSInteger i=self.array.count-1; i>= 0; i--) {
        if([self.array[i] compare:self.array[p]] == NSOrderedDescending) {
            NSMutableArray *mutArray = [self.array mutableCopy];
            [mutArray exchangeObjectAtIndex:p withObjectAtIndex:i];
            self.array = [self reverseArray:mutArray startingAt:p+1];
            return self.array;
        }
    }
    
    return nil;
}

- (NSArray *)reverseArray:(NSArray *)array startingAt:(NSInteger)start {
    NSMutableArray *mutArray = [array mutableCopy];
    NSRange reverseRange = NSMakeRange(start, array.count-start);
    NSArray *subarrayToReverse = [mutArray subarrayWithRange:reverseRange];
    subarrayToReverse = [[subarrayToReverse reverseObjectEnumerator] allObjects];
    [mutArray replaceObjectsInRange:reverseRange withObjectsFromArray:subarrayToReverse];
    return mutArray;
}
@end
