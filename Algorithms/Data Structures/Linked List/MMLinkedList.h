//
//  MMLinkedList.h
//  Algorithms
//
//  Created by Mike MacDougall on 2/2/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMLinkedList : NSObject
+ (instancetype)list;
- (void)addValue:(id)value;
- (BOOL)findFirstValue:(id)value;
- (BOOL)removeFirstValue:(id)value;
- (NSArray *)allValues;
- (void)reverseIterator:(void(^)(id value))iterator;
@end

