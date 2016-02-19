//
//  MMAirportItinerary.h
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/18/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMAirportItinerary : NSObject
+ (NSArray <NSString *> *)itineraryForTickets:(NSArray <NSArray <NSString *> *> *)tickets;
@end
