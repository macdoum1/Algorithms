//
//  NSArray+MMSearch.h
//  Algorithms
//
//  Created by Mike MacDougall on 1/28/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MMSearchType) {
    MMSearchTypeIterator,
    MMSearchTypeBinary,
    MMSearchTypeHash
};

@interface NSArray (MMSearching)
- (NSUInteger)searchForObj:(id)obj type:(MMSearchType)type;
@end
