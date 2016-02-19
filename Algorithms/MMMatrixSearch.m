//
//  MMMatrixSearch.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/18/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMMatrixSearch.h"
@implementation MMMatrixSearch
+ (MMMatrixSearchResult *)indexOfObject:(id)object inMatrix:(NSArray <NSArray *> *)matrix {
    MMMatrixSearchResult *result = [[MMMatrixSearchResult alloc] init];
    [matrix enumerateObjectsUsingBlock:^(NSArray *subarray, NSUInteger row, BOOL *stop) {
        NSInteger col = [subarray indexOfObject:object inSortedRange:NSMakeRange(0, subarray.count) options:NSBinarySearchingFirstEqual usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
        if(col != NSNotFound) {
            result.row = @(row);
            result.col = @(col);
            *stop = YES;
        }
    }];
    return result;
}
@end

@implementation MMMatrixSearchResult
@end
