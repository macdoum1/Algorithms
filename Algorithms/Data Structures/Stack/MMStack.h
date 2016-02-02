//
//  MMStack.h
//  Algorithms
//
//  Created by Mike MacDougall on 2/1/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMStack : NSObject
+ (instancetype)stack;
- (void)push:(id)obj;
- (id)pop;
- (id)peek;
@property (nonatomic, assign, readonly) NSInteger size;
@end
