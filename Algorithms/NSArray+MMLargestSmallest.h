//
//  NSArray+MMLargestSmallest.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/10/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (MMLargestSmallest)
- (id)nthLargestValue:(NSInteger)n;
- (id)nthSmallestValue:(NSInteger)n;
@end
