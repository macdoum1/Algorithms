//
//  MMHIndex.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/19/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMHIndex.h"

@implementation MMHIndex
+ (NSInteger)hIndexForCitations:(NSArray <NSNumber *> *)citations {
    // Sort and reverse
    NSArray <NSNumber *> *sorted = [citations sortedArrayUsingSelector:@selector(compare:)];
    sorted = [[sorted reverseObjectEnumerator] allObjects];
    
    // 3 0 6 1 5
    // 0 1 3 5 6
    // 6 5 3 1 0
    __block NSInteger hIndex = NSNotFound;
    [sorted enumerateObjectsUsingBlock:^(NSNumber *citation, NSUInteger idx, BOOL *stop) {
        if(citation.integerValue == idx + 1) {
            hIndex = citation.integerValue;
            *stop = YES;
        }
    }];
    return hIndex;
}
@end
