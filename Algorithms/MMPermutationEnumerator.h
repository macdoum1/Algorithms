//
//  MMPermutationEnumerator.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/21/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMPermutationEnumerator : NSEnumerator
+ (instancetype)enumeratorWithArray:(NSArray *)array;
@end
