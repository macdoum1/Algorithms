//
//  NSString+MMCompression.h
//  Algorithms
//
//  Created by Mike MacDougall on 2/4/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MMCompression)
// aaabbccdddd = a3b2c2d4
- (NSString *)compressedString;
@end
