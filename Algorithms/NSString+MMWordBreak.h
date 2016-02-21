//
//  NSString+MMWordBreak.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/19/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MMWordBreak)
- (BOOL)stringCouldBeSegmentedIntoWordsFromDictionary:(NSArray <NSString *> *)dictionary;
@end
