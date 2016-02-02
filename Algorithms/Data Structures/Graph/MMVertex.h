//
//  MMVertex.h
//  Algorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MMEdge.h"

@interface MMVertex : NSObject
@property (nonatomic, strong) id value;
@property (nonatomic, strong) NSMutableSet <MMEdge *> *adjacentEdges;
@property (nonatomic, assign) BOOL wasVisited;

+ (instancetype)vertexWithValue:(id)value;
@end
