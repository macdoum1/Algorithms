//
//  MMMaximumStockProfit.m
//  Algorithms
//
//  Created by Mike MacDougall on 2/4/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMMaximumStockProfit.h"
#import <UIKit/UIKit.h>

@implementation MMMaximumStockProfit
+ (NSArray <NSNumber *> *)buySellForMaxProfit:(NSArray <NSDecimalNumber *> *)valuesOverTime {
    NSDecimalNumber *currentMinBuy = valuesOverTime.firstObject;
    NSDecimalNumber *maxProfit = [NSDecimalNumber minimumDecimalNumber];
    
    NSNumber *buyIdx;
    NSNumber *sellIdx;
    for(NSInteger i=1; i<valuesOverTime.count; i++) {
        NSDecimalNumber *profit = [valuesOverTime[i] decimalNumberBySubtracting:currentMinBuy];
        if([maxProfit compare:profit] == NSOrderedAscending) {
            maxProfit = profit;
            sellIdx = @(i);
        }
        
        if([valuesOverTime[i] compare:currentMinBuy] == NSOrderedAscending) {
            currentMinBuy = valuesOverTime[i];
            buyIdx = @(i);
        }
        
    }
    return @[buyIdx, sellIdx];
}
@end
