//
//  Person.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 19/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)personFromDictionary:(NSDictionary *)data {
    Person *item = [self new];
    item.uri = data[@"_uri"];
    item.email = data[@"email"];
    item.firstName = data[@"first_name"];
    item.lastName = data[@"last_name"];
    
    return item;
}

@end
