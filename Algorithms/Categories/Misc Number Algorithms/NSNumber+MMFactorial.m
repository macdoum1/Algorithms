//
//  NSNumber+MMFactorial.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/2/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "NSNumber+MMFactorial.h"

/*

 4! =
 3! * 4 =
 2! * 3 * 4 =
 !1 * 2 * 3 * 4 =
 
*/

@implementation NSNumber (MMFactorial)
+ (NSNumber *)nFactorial:(NSInteger)n {
    return @([self recursiveNFactorial:n]);
}

+ (NSInteger)recursiveNFactorial:(NSInteger)n {
    if(n == 0) {
        return 1;
    }
    
    return [self recursiveNFactorial:n-1] * n;
}

+ (NSNumber *)nFactorialIterative:(NSInteger)n {
    NSInteger factorial = 1;
    for(NSInteger i=1; i<=n; i++) {
        factorial = factorial * i;
    }
    return @(factorial);
}
@end
