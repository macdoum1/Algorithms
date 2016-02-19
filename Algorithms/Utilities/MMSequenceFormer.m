//
//  MMSequenceFormer.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/11/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMSequenceFormer.h"

@implementation MMSequenceFormer

+ (NSString *)increasingDecreasingSequenceForSequence:(NSString *)sequence {
    NSMutableArray <NSNumber *> *currentCharacterStrings = [NSMutableArray array];
    
    NSInteger minimumAvailable = 1;
    NSInteger positionOfI = 0;
    
    if([[sequence substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"I"]) {
        [currentCharacterStrings addObject:@1];
        [currentCharacterStrings addObject:@2];
        minimumAvailable = 3;
        positionOfI = 1;
    } else {
        [currentCharacterStrings addObject:@2];
        [currentCharacterStrings addObject:@1];
        minimumAvailable = 3;
        positionOfI = 0;
    }
    for(NSInteger i=1; i<sequence.length; i++) {
        NSString *characterString = [sequence substringWithRange:NSMakeRange(i, 1)];
        if([characterString isEqualToString:@"I"]) {
            [currentCharacterStrings addObject:@(minimumAvailable)];
            positionOfI = i + 1;
        } else if([characterString isEqualToString:@"D"]) {
            [currentCharacterStrings addObject:currentCharacterStrings[i]];
            for(NSInteger j=positionOfI; j<=i; j++) {
                currentCharacterStrings[j] = @(currentCharacterStrings[j].integerValue + 1);
            }
        }
        minimumAvailable++;
    }
    
    NSMutableString *string = [NSMutableString string];
    for(NSNumber *num in currentCharacterStrings) {
        [string appendString:[NSString stringWithFormat:@"%ld", (long)num.integerValue]];
    }
    
    return string;
}
@end
