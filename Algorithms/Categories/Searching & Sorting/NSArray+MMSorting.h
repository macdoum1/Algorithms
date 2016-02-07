//
//  NSArray+MMSorting.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 1/27/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, MMSortType) {
    MMSortTypeMerge,
    MMSortTypeQuick,
    MMSortTypeInsertion,
    MMSortTypeBucket
};

@interface NSArray (MMSorting)
- (NSArray *)sortedArrayWithType:(MMSortType)type;
- (BOOL)isSorted;
@end
