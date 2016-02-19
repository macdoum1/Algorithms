//
//  MMSequenceFormer.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/11/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

// This is a WIP
@interface MMSequenceFormer : NSObject
// Input sequence should only contain 'D's and 'I's (ex. "DDDII")
+ (NSString *)increasingDecreasingSequenceForSequence:(NSString *)sequence;
@end
