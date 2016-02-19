//
//  MMAirportItineraryTests.m
//  MMAlgorithms
//
//  Created by Mike MacDougall on 2/18/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMAirportItinerary.h"

@interface MMAirportItineraryTests : XCTestCase

@end

@implementation MMAirportItineraryTests

- (void)testItinerary {
    NSArray <NSArray <NSString *> *> *tickets = @[@[@"JFK",@"SFO"],@[@"JFK",@"ATL"],@[@"SFO",@"ATL"],@[@"ATL",@"JFK"],@[@"ATL",@"SFO"]];
    NSArray *itinerary = [MMAirportItinerary itineraryForTickets:tickets];
    NSArray *target = @[@"JFK",@"ATL",@"JFK",@"SFO",@"ATL",@"SFO"];
    XCTAssertEqualObjects(itinerary, target);
}

@end
