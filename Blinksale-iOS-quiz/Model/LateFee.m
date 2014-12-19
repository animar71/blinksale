//
//  LateFee.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 17/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "LateFee.h"

@implementation LateFee

+ (instancetype)lateFeeFromDictionary:(NSDictionary *)data {
    LateFee *item = [self new];
    
    item.precentage = [data objectForKey:@"__text"];
    item.amount = [data objectForKey:@"_amount"];
    
    return item;
}

@end
