//
//  NSString+MMCompression.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/4/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "NSString+MMCompression.h"

@implementation NSString (MMCompression)
- (NSString *)compressedString {
    NSMutableString *string = [self mutableCopy];
    NSInteger i = 0;
    NSInteger numOfChars = 1;
    while(i<string.length) {
        NSString *charStringAtIndex = [string substringWithRange:NSMakeRange(i, 1)];
        
        NSString *nextCharString = nil;
        if(i+1<string.length) {
            nextCharString = [string substringWithRange:NSMakeRange(i+1, 1)];
        }
        
        if([charStringAtIndex isEqualToString:nextCharString]) {
            numOfChars++;
            i++;
        } else {
            NSInteger startOfRange = i - (numOfChars - 1);
            NSRange rangeToReplace = NSMakeRange(startOfRange, numOfChars);
            NSString *replacementString;
            if(numOfChars > 1) {
                replacementString = [NSString stringWithFormat:@"%@%ld", charStringAtIndex, (long)numOfChars];
            } else {
                replacementString = charStringAtIndex;
            }
            [string replaceCharactersInRange:rangeToReplace withString:replacementString];
            i = startOfRange + replacementString.length;
            numOfChars = 1;
        }
    }
    
    return string;
}

@end
