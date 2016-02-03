//
//  MMSubarrayUtility.h
//  Algorithms
//
//  Created by Mike MacDougall on 2/2/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMSubarrayUtility : NSObject
+ (NSArray <NSNumber *> *)subArrayOfArray:(NSArray <NSNumber *> *)array
                                  withSum:(NSNumber *)number;
+ (NSInteger)lengthOfLongestIncreasingSubarray:(NSArray *)array;
@end
