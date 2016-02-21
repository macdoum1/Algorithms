//
//  MMIntervalInsertion.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/21/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMIntervalInsertion : NSEnumerator
+ (NSArray <NSValue *> *)insertInterval:(NSRange)interval intoIntervals:(NSArray <NSValue *> *)intervals;
@end
