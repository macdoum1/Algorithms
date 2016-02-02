//
//  MMGraph.m
//  Algorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMGraph.h"

#import "MMQueue.h"

@interface MMGraph ()
@property (nonatomic, copy) NSSet *vertices;
@end
@implementation MMGraph

#pragma mark - Init, Convienience & Adding Vertices
- (instancetype)init {
    self = [super init];
    if(self) {
        self.vertices = [NSMutableSet set];
    }
    return self;
}

+ (instancetype)graph {
    return [[MMGraph alloc] init];
}

- (MMEdge *)addEdgeFromVertex:(MMVertex *)fromVertex
                     toVertex:(MMVertex *)toVertex
                       weight:(NSNumber *)weight {
    MMEdge *edge = [MMEdge edgeAdjacentFrom:fromVertex adjacentTo:toVertex weight:weight];
    
    [fromVertex.adjacentEdges addObject:edge];
    [toVertex.adjacentEdges addObject:edge];
    
    NSMutableSet *mutSet = [NSMutableSet setWithSet:self.vertices];
    [mutSet addObject:fromVertex];
    [mutSet addObject:toVertex];
    self.vertices = mutSet;
    
    return edge;
}

#pragma mark - Directed Graph
- (BOOL)isDirectedGraph {
    for(MMVertex *vertex in self.vertices) {
        if(![self vertexHasOppositeEdge:vertex]) {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)vertexHasOppositeEdge:(MMVertex *)vertex {
    for(MMEdge *edgeFromCurrentVertex in vertex.adjacentEdges) {
        for(MMEdge *edgeFromAdjacentVertex in edgeFromCurrentVertex.adjacentTo.adjacentEdges) {
            if(vertex == edgeFromAdjacentVertex.adjacentTo) {
                return YES;
            }
        }
    }
    return NO;
}

#pragma mark - Prim AST
- (NSArray *)primASTWithStart:(MMVertex *)start {
    NSMutableArray <MMEdge *> *edges = [NSMutableArray array];
    [self clearHistory];
    
    start.wasVisited = YES;
    
    while([self visitedVertices].count != self.vertices.count) {
        MMEdge *minimumEdge = [self minimumEdgeInVertices:[self visitedVertices]];
        if(minimumEdge) {
            [edges addObject:minimumEdge];
        }
        minimumEdge.adjacentTo.wasVisited = YES;
    }
    for(MMEdge *edge in edges) {
        NSLog(@"From: %@ To: %@", edge.adjacentFrom.value, edge.adjacentTo.value);
    }
    return edges;
}

- (NSArray <MMVertex *> *)visitedVertices {
    NSMutableArray *visitedVertices = [NSMutableArray array];
    for(MMVertex *vertex in self.vertices) {
        if(vertex.wasVisited) {
            [visitedVertices addObject:vertex];
        }
    }
    return visitedVertices;
}

- (MMEdge *)minimumEdgeInVertices:(NSArray <MMVertex *> *)vertices {
    MMEdge *minimumEdge = nil;
    for(MMVertex *vertex in vertices) {
        for(MMEdge *edge in vertex.adjacentEdges) {
            if(!minimumEdge && !edge.adjacentTo.wasVisited) {
                minimumEdge = edge;
            } else if(edge && minimumEdge && [edge.weight compare:minimumEdge.weight] == NSOrderedAscending && !edge.adjacentTo.wasVisited) {
                minimumEdge = edge;
            }
        }
    }
    return minimumEdge;
}

#pragma mark - Clearing History associate with graph algorithms
- (void)clearHistory {
    for (MMVertex *vertex in self.vertices) {
        for (MMEdge *edge in vertex.adjacentEdges) {
            edge.used = NO;
        }
        vertex.wasVisited = NO;
    }
}

@end
