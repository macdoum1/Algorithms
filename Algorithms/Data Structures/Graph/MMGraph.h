//
//  MMGraph.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MMVertex.h"

@interface MMGraph : NSObject
- (MMEdge *)addEdgeFromVertex:(MMVertex *)fromVertex
                     toVertex:(MMVertex *)toVertex
                       weight:(NSNumber *)weight;
+ (instancetype)graph;
@property (nonatomic, readonly, copy) NSSet *vertices;

- (BOOL)isDirectedGraph;
- (NSArray *)primASTWithStart:(MMVertex *)start;
@end
