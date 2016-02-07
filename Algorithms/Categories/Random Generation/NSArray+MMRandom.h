//
//  NSArray+MMRandom.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (MMRandom)
+ (instancetype)randomIntArrayWithSize:(NSInteger)size
                         valuesBetween:(NSInteger)from
                                    to:(NSInteger)to;
@end
