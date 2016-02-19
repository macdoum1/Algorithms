//
//  MMAirportItinerary.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/18/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "MMAirportItinerary.h"

#import "MMPriorityQueue.h"

@implementation MMAirportItinerary
+ (NSArray <NSString *> *)itineraryForTickets:(NSArray <NSArray <NSString *> *> *)tickets {
    NSMutableDictionary <NSString *, MMPriorityQueue <NSString *> *> *map = [NSMutableDictionary dictionary];
    for(NSArray <NSString *> *ticket in tickets) {
        NSString *depart = ticket.firstObject;
        NSString *arrival = ticket.lastObject;
        if(!map[depart]) {
            map[depart] = [MMPriorityQueue queue];
        }
        [map[depart] push:arrival];
        
    }
    
    NSMutableArray <NSString *> *itinerary = [NSMutableArray array];
    NSString *location = @"JFK";
    while(location) {
        [itinerary addObject:location];
        location = [map[location] pop];
    }
    
    return itinerary;
}
@end
