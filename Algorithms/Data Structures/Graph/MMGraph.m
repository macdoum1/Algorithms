//
//  MMGraph.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMGraph.h"

#import "MMQueue.h"
#import "MMStack.h"
#import "NSArray+MMFunctional.h"

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
    
    NSMutableArray *visitedVertices = [NSMutableArray array];
    [visitedVertices addObject:start];
    while(visitedVertices.count != self.vertices.count) {
        MMEdge *minimumEdge = [self minimumEdgeInVisitedVerticies:visitedVertices];
        if(minimumEdge) {
            [edges addObject:minimumEdge];
        }
        [visitedVertices addObject:minimumEdge.adjacentTo];
    }
    return edges;
}

- (MMEdge *)minimumEdgeInVisitedVerticies:(NSArray <MMVertex *> *)vertices {
    MMEdge *minimumEdge = nil;
    for(MMVertex *vertex in vertices) {
        for(MMEdge *edge in vertex.adjacentEdges) {
            BOOL wasAdjacentToVisited = [vertices indexOfObject:edge.adjacentTo] != NSNotFound;
            if(!minimumEdge && !wasAdjacentToVisited) {
                minimumEdge = edge;
            } else if(edge && minimumEdge && [edge.weight compare:minimumEdge.weight] == NSOrderedAscending && !wasAdjacentToVisited) {
                minimumEdge = edge;
            }
        }
    }
    return minimumEdge;
}

#pragma mark - Depth First Traversal
- (NSArray *)depthFirstTraversal:(MMVertex *)start {
    
    NSMutableArray *visitedVertices = [NSMutableArray array];
    
    MMStack *stack = [MMStack stack];
    [stack push:start];
    
    while (stack.size > 0) {
        MMVertex *vertex = [stack pop];
        [visitedVertices addObject:vertex];
        for(MMEdge *edge in vertex.adjacentEdges) {
            MMVertex *nextVertex = edge.adjacentTo;
            if(nextVertex && [visitedVertices indexOfObject:nextVertex] == NSNotFound) {
                [stack push:nextVertex];
            }
        }
    }
    
    return [visitedVertices map:^id(MMVertex *vertex) {
        return vertex.value;
    }];
    
}

#pragma mark - Breadth First Traversal
- (NSArray *)breadthFirstTraversal:(MMVertex *)start {
    NSMutableArray *visitedVertices = [NSMutableArray array];
    
    MMQueue *queue = [MMQueue queue];
    [queue push:start];
    
    while (queue.size > 0) {
        MMVertex *vertex = [queue pop];
        [visitedVertices addObject:vertex];
        for(MMEdge *edge in vertex.adjacentEdges) {
            MMVertex *nextVertex = edge.adjacentTo;
            if(nextVertex && [visitedVertices indexOfObject:nextVertex] == NSNotFound) {
                [queue push:nextVertex];
            }
        }
    }
    
    return [visitedVertices map:^NSString *(MMVertex *vertex) {
        return vertex.value;
    }];
}



@end
