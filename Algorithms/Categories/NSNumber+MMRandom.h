//
//  NSNumber+MMRandom.h
//  Algorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MMRandom)
+ (instancetype)randomIntBetween:(NSInteger)from to:(NSInteger)to;
@end
