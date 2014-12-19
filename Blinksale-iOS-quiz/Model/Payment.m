//
//  PaymentComment.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 17/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "Utils.h"
#import "Payment.h"

@implementation Payment

+ (instancetype)paymentFromDictionary:(NSDictionary *)data {
    Payment *item = [self new];
    item.created = [Utils makeDateFromString:data[@"_created_at"]];
    item.uri = data[@"_uri"];
    item.amount = data[@"amount"];
    item.date = data[@"date"];
    item.number = data[@"number"];
    item.paymentMethod = data[@"payment_method"];
    
    return item;
}

@end
