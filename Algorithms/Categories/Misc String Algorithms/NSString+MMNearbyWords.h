//
//  NSString+MMNearbyWords.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/29/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

// WIP!
@interface NSString (MMNearbyWords)
- (NSArray <NSString *> *)nearbyWords;
- (NSArray <NSString *> *)characterStringsInWord;
@end
