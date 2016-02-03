//
//  MMLinkedList.m
//  Algorithms
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
@end

@implementation MMLinkedList
+ (instancetype)list {
    return [[MMLinkedList alloc] init];
}

- (void)addValue:(id)value {
    if(!self.head) {
        self.head = [MMLinkedListNode nodeWithValue:value];
        return;
    }
    
    MMLinkedListNode *lastNode = self.head;

    while (lastNode.next) {
        lastNode = lastNode.next;
    }
    
    lastNode.next = [MMLinkedListNode nodeWithValue:value];
    
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
@end

@implementation MMLinkedListNode
+ (instancetype)nodeWithValue:(id)value {
    MMLinkedListNode *node = [[MMLinkedListNode alloc] init];
    node.value = value;
    return node;
}
@end
