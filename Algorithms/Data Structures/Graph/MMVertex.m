//
//  MMVertex.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMVertex.h"

@implementation MMVertex
- (instancetype)init {
    self = [super init];
    if(self) {
        self.adjacentEdges = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)vertexWithValue:(id)value {
    MMVertex *vertex = [[MMVertex alloc] init];
    vertex.value = value;
    return vertex;
}

- (NSString *)description {
    return [self.value description];
}
@end
