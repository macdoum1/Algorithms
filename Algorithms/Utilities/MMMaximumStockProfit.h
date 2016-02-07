//
//  MMMaximumStockProfit.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/4/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMMaximumStockProfit : NSObject
+ (NSArray <NSNumber *> *)buySellForMaxProfit:(NSArray <NSDecimalNumber *> *)valuesOverTime;
@end
