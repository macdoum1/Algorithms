//
//  NSString+MMNearbyWords.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/29/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "NSString+MMNearbyWords.h"

#import <UIKit/UIKit.h>

@implementation NSString (MMNearbyWords)
- (NSArray <NSString *> *)nearbyWords {
    NSMutableArray *nearbyWords = [NSMutableArray array];
    
    NSArray <NSString *> *characterStringsInWord = [self characterStringsInWord];
    [characterStringsInWord enumerateObjectsUsingBlock:^(NSString *characterString, NSUInteger i, BOOL *stop) {
        NSArray <NSString *> *nearbyCharacters = [self nearbyCharacterStringsByCharacterString:characterString];
        [nearbyCharacters enumerateObjectsUsingBlock:^(NSString *nearbyCharacterString, NSUInteger j, BOOL *stop) {
            NSString *possibleString = [self stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:nearbyCharacterString];
            if([possibleString isDictionaryWord]) {
                [nearbyWords addObject:possibleString];
            }
        }];
    }];
    
    return nearbyWords;
}

- (NSArray <NSString *> *)characterStringsInWord {
    NSMutableArray *characterStringsInWord = [NSMutableArray array];
    for(NSUInteger i=0; i < self.length; i++) {
        unichar character = [self characterAtIndex:i];
        NSString *characterString = [NSString stringWithCharacters:&character length:1];
        [characterStringsInWord addObject:characterString];
    }
    return characterStringsInWord;
}


// Note: not correct or complete, purely for learning purposes
- (NSArray <NSString *> *)nearbyCharacterStringsByCharacterString:(NSString *)characterString {
    if([characterString isEqualToString:@"g"]) {
        return @[@"h", @"j", @"f"];
    }
    
    if([characterString isEqualToString:@"i"]) {
        return @[@"u", @"k", @"o"];
    }
    
    return nil;
}

- (BOOL)isDictionaryWord {
    UITextChecker *checker = [[UITextChecker alloc] init];
    NSString *currentLanguage = [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
    NSRange searchRange = NSMakeRange(0, self.length);
    NSRange misspelledRange = [checker rangeOfMisspelledWordInString:self
                                                               range:searchRange
                                                          startingAt:0
                                                                wrap:NO
                                                            language:currentLanguage];
    return misspelledRange.location == NSNotFound;
}
@end
