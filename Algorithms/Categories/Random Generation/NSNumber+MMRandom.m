//
//  NSNumber+MMRandom.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "NSNumber+MMRandom.h"

@implementation NSNumber (MMRandom)
+ (instancetype)randomIntBetween:(NSInteger)from to:(NSInteger)to {
    return @(from + arc4random() % (to-from+1));
}
@end
