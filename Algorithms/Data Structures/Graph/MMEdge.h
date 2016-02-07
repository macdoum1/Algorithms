//
//  MMEdge.h
//  Algorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MMVertex;

@interface MMEdge : NSObject
@property (nonatomic, strong) MMVertex *adjacentFrom;
@property (nonatomic, strong) MMVertex *adjacentTo;
@property (nonatomic, strong) NSNumber *weight;

+ (instancetype)edgeAdjacentFrom:(MMVertex *)adjacentFrom
                      adjacentTo:(MMVertex *)adjacentTo
                          weight:(NSNumber *)weight;
@end
