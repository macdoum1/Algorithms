//
//  MMGraphTests.m
//  Algorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMGraph.h"

@interface MMGraphTests : XCTestCase

@end

@implementation MMGraphTests
/*
 
    @1--(1)--@2--(2)--@3
             |        |
            (4)      (2)
             |        |
             @5--(5)--@4--(11)--@6
                      |
                     (1)
                      |
                      @7
 
*/

- (void)testGraph {
    MMGraph *graph = [MMGraph graph];
    
    MMVertex *one = [MMVertex vertexWithValue:@1];
    MMVertex *two = [MMVertex vertexWithValue:@2];
    MMVertex *three = [MMVertex vertexWithValue:@3];
    MMVertex *four = [MMVertex vertexWithValue:@4];
    MMVertex *five = [MMVertex vertexWithValue:@5];
    MMVertex *six = [MMVertex vertexWithValue:@6];
    MMVertex *seven = [MMVertex vertexWithValue:@7];
    
    [graph addEdgeFromVertex:one toVertex:two weight:@1];
    [graph addEdgeFromVertex:two toVertex:three weight:@2];
    [graph addEdgeFromVertex:two toVertex:five weight:@4];
    [graph addEdgeFromVertex:five toVertex:four weight:@5];
    [graph addEdgeFromVertex:three toVertex:four weight:@2];
    [graph addEdgeFromVertex:four toVertex:seven weight:@1];
    [graph addEdgeFromVertex:four toVertex:six weight:@11];
    
    XCTAssert(true);
}

- (void)testIsDirectedGraphWithUnDirectedGraph {
    MMGraph *graph = [MMGraph graph];
    
    MMVertex *A = [MMVertex vertexWithValue:@1];
    MMVertex *B = [MMVertex vertexWithValue:@2];
    [graph addEdgeFromVertex:A toVertex:B weight:@1];
    [graph addEdgeFromVertex:B toVertex:A weight:@1];
    
    XCTAssert(![graph isDirectedGraph]);
}

- (void)testIsDirectedGraphWithDirectedGraph {
    MMGraph *graph = [MMGraph graph];
    
    MMVertex *A = [MMVertex vertexWithValue:@1];
    MMVertex *B = [MMVertex vertexWithValue:@2];
    [graph addEdgeFromVertex:A toVertex:B weight:@1];
    [graph addEdgeFromVertex:B toVertex:A weight:@1];
    
    XCTAssert(![graph isDirectedGraph]);
}

- (void)testPrimAST {
    MMGraph *graph = [MMGraph graph];
    
    MMVertex *one = [MMVertex vertexWithValue:@1];
    MMVertex *two = [MMVertex vertexWithValue:@2];
    MMVertex *three = [MMVertex vertexWithValue:@3];
    MMVertex *four = [MMVertex vertexWithValue:@4];
    MMVertex *five = [MMVertex vertexWithValue:@5];
    MMVertex *six = [MMVertex vertexWithValue:@6];
    
    [graph addEdgeFromVertex:one toVertex:four weight:@5];
    [graph addEdgeFromVertex:four toVertex:one weight:@5];
    
    [graph addEdgeFromVertex:four toVertex:six weight:@2];
    MMEdge *sixToFour = [graph addEdgeFromVertex:six toVertex:four weight:@2];
    
    [graph addEdgeFromVertex:six toVertex:five weight:@6];
    [graph addEdgeFromVertex:five toVertex:six weight:@6];
    
    [graph addEdgeFromVertex:five toVertex:two weight:@3];
    MMEdge *twoToFive = [graph addEdgeFromVertex:two toVertex:five weight:@3];
    
    [graph addEdgeFromVertex:two toVertex:one weight:@6];
    [graph addEdgeFromVertex:one toVertex:two weight:@6];
    
    [graph addEdgeFromVertex:three toVertex:one weight:@1];
    MMEdge *oneToThree = [graph addEdgeFromVertex:one toVertex:three weight:@1];
    
    [graph addEdgeFromVertex:three toVertex:four weight:@5];
    [graph addEdgeFromVertex:four toVertex:three weight:@5];
    
    MMEdge *threeToSix = [graph addEdgeFromVertex:three toVertex:six weight:@4];
    [graph addEdgeFromVertex:six toVertex:three weight:@4];
    
    [graph addEdgeFromVertex:three toVertex:five weight:@6];
    [graph addEdgeFromVertex:five toVertex:three weight:@6];
    
    MMEdge *threeToTwo = [graph addEdgeFromVertex:three toVertex:two weight:@5];
    [graph addEdgeFromVertex:two toVertex:three weight:@5];
    
    NSArray <MMEdge *> *edges = [graph primASTWithStart:one];
    NSArray *targetArray = @[oneToThree, threeToSix, sixToFour, threeToTwo, twoToFive];
    XCTAssertEqualObjects(edges, targetArray);
}

@end
