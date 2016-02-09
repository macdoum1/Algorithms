//
//  MMDivisionUtility.m
//  MMAlgorithms
//
//  Created by Michael MacDougall on 2/7/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMDivisionUtility.h"

@implementation MMDivisionUtility
+ (NSInteger)dividerNumerator:(NSInteger)numerator denominator:(NSInteger)denominator {
    if(denominator == 0) {
        NSAssert(NO, @"Divide by zero!");
    }
    
    NSInteger sign = 1;
    if(numerator < 0) {
        numerator = -numerator;
        sign = -sign;
    }
    
    if(denominator < 0) {
        denominator = -denominator;
        sign = -sign;
    }
    
    NSInteger count = 0;
    NSInteger current = numerator;
    while(current >= denominator) { 
        current -= denominator;
        count++;
    }
    
    return count * sign;
}
@end
