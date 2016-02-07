//
//  MMLinkedList.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/2/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMLinkedList.h"

@interface MMLinkedListNode : NSObject
@property (nonatomic, strong) id value;
@property (nonatomic, strong) MMLinkedListNode *next;
+ (instancetype)nodeWithValue:(id)value;
@end

@interface MMLinkedList ()
@property (nonatomic, strong) MMLinkedListNode *head;
@property (nonatomic, strong) MMLinkedListNode *tail;
@end

@implementation MMLinkedList
+ (instancetype)list {
    return [[MMLinkedList alloc] init];
}

- (void)addValue:(id)value {
    MMLinkedListNode *newNode = [MMLinkedListNode nodeWithValue:value];
    if(!self.head) {
        self.head = newNode;
        self.tail = newNode;
    } else {
        self.tail.next = newNode;
        self.tail = newNode;
    }
}

- (BOOL)findFirstValue:(id)value {
    BOOL foundValue = NO;
    MMLinkedListNode *node = self.head;
    while (node) {
        if([node.value isEqual:value]) {
            foundValue = YES;
            break;
        }
        node = node.next;
    }
    return foundValue;
}

- (BOOL)removeFirstValue:(id)value {
    BOOL removedValue = NO;
    MMLinkedListNode *node = self.head;
    MMLinkedListNode *lastNode = nil;
    while(node) {
        if([node.value isEqual:value]) {
            if(node == self.head) {
                self.head = node.next;
            } else {
                lastNode.next = node.next;
            }
            removedValue = YES;
            break;
        }
        lastNode = node;
        node = node.next;
    }
    
    return removedValue;
}

- (NSArray *)allValues {
    NSMutableArray *values = [NSMutableArray array];
    
    MMLinkedListNode *node = self.head;
    while (node) {
        if(node.value) {
            [values addObject:node.value];
        }
        node = node.next;
    }
    
    return values;
}

- (void)reverseIterator:(void(^)(id value))iterator {
    NSArray *allValues = [self allValues];
    for(id value in [allValues reverseObjectEnumerator]) {
        if(iterator) {
            iterator(value);
        }
    }
}
@end

@implementation MMLinkedListNode
+ (instancetype)nodeWithValue:(id)value {
    MMLinkedListNode *node = [[MMLinkedListNode alloc] init];
    node.value = value;
    return node;
}
@end
