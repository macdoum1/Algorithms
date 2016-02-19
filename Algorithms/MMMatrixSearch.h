//
//  MMMatrixSearch.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/18/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMMatrixSearchResult : NSObject
@property (nonatomic, strong) NSNumber *row;
@property (nonatomic, strong) NSNumber *col;
@end

@interface MMMatrixSearch : NSObject
+ (MMMatrixSearchResult *)indexOfObject:(id)object inMatrix:(NSArray <NSArray *> *)matrix;
@end
