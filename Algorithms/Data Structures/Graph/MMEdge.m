//
//  MMEdge.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMEdge.h"

@implementation MMEdge
+ (instancetype)edgeAdjacentFrom:(MMVertex *)adjacentFrom
                      adjacentTo:(MMVertex *)adjacentTo
                          weight:(NSNumber *)weight {
    MMEdge *edge = [[MMEdge alloc] init];
    edge.adjacentFrom = adjacentFrom;
    edge.adjacentTo = adjacentTo;
    edge.weight = weight;
    return edge;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"From: %@ To: %@", self.adjacentFrom, self.adjacentTo];
}
@end
