//
//  MMBulbSwitcher.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/19/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMBulbSwitcher.h"

@implementation MMBulbSwitcher
+ (NSInteger)numberOfBulbsOnFromTotal:(NSInteger)total {
    NSMutableArray <NSNumber *> *bulbs = [NSMutableArray array];
    for(NSInteger i=0; i<total; i++) {
        [bulbs addObject:@(YES)];
    }
    
    for(NSInteger i=0; i<total; i++) {
        if((i+1) % 2 == 0) {
            bulbs[i] = @(NO);
        }
    }
    
    for(NSInteger i=0; i<total; i++) {
        if((i+1) % 3 == 0) {
            bulbs[i] = @(!bulbs[i].boolValue);
        }
    }
    
    NSCountedSet <NSNumber *> *set = [NSCountedSet setWithArray:bulbs];
    return [set countForObject:@(YES)];
}
@end
