//
//  MMMatrixRotation.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/21/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMMatrixRotation.h"

@implementation MMMatrixRotation
+ (NSArray <NSArray *> *)rotateMatrix:(NSArray <NSArray *> *)matrix {
    NSMutableArray <NSMutableArray *> *mutMatrix = [NSMutableArray array];
    for(NSArray *array in matrix) {
        [mutMatrix addObject:[array mutableCopy]];
    }
    
    for(NSInteger i=1; i<mutMatrix.count; i++) {
        for(NSInteger j=0; j < i; j++) {
            id temp = matrix[i][j];
            mutMatrix[i][j] = mutMatrix[j][i];
            mutMatrix[j][i] = temp;
        }
    }
    
    for(NSInteger i=0; i<matrix.count; i++) {
        mutMatrix[i] = [[[mutMatrix[i] reverseObjectEnumerator] allObjects] mutableCopy];
    }
    
    return mutMatrix;
}
@end
