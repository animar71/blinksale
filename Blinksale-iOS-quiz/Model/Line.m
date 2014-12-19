//
//  Line.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 17/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "Line.h"

@implementation Line

+ (instancetype)lineFromDictionary:(NSDictionary *)data {
    Line *item = [self new];
    
    item.name = data[@"name"];
    item.quantity = data[@"quantity"];
    item.unitPrice = data[@"unit_price"];
    item.units = data[@"units"];
    item.isTaxed = [data[@"taxed"] isEqualToString:@"true"] ? YES : NO;
    
    return item;
}

@end
