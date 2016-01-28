//
//  ViewController.m
//  Algorithms
//
//  Created by Mike MacDougall on 1/27/16.
//  Copyright © 2016 Michael MacDougall. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+MMSorting.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    NSArray *startArray = @[@100, @1, @250, @24, @89, @200, @65, @175, @189];
    
    NSArray *sortedArray = [startArray sortedArrayWithType:MMSortTypeQuick];
    
    sortedArray = sortedArray;
}



@end
