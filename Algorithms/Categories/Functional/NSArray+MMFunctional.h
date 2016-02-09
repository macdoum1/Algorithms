//
//  NSArray+MMFunctional.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^MMFunctionalMapBlock)(id obj);

@interface NSArray (MMFunctional)
- (NSArray *)flattenArray;
- (NSArray *)map:(MMFunctionalMapBlock)action;
- (NSArray *)arrayByRemovingDuplicates;
@end
