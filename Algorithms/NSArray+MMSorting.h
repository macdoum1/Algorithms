//
//  NSArray+MMSorting.h
//  Algorithms
//
//  Created by Mike MacDougall on 1/27/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, MMSortType) {
    MMSortTypeMerge,
    MMSortTypeQuick
};

@interface NSArray (MMSorting)
- (NSArray *)sortedArrayWithType:(MMSortType)type;
@end
