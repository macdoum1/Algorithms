//
//  MMQueue.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMQueue : NSObject
+ (instancetype)queue;
- (void)push:(id)obj;
- (id)pop;
- (id)peek;
- (NSArray *)arrayRepresentation;
@property (nonatomic, assign, readonly) NSInteger size;
@end
