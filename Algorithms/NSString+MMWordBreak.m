//
//  NSString+MMWordBreak.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/19/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "NSString+MMWordBreak.h"

@implementation NSString (MMWordBreak)
- (BOOL)stringCouldBeSegmentedIntoWordsFromDictionary:(NSArray <NSString *> *)dictionary {
    NSMutableString *string = [self mutableCopy];
    for(NSString *dictWord in dictionary) {
        NSRange range = [string rangeOfString:dictWord];
        if(range.location != NSNotFound) {
            [string replaceCharactersInRange:range withString:@""];
        }
    }
    
    return string.length == 0;
}
@end
