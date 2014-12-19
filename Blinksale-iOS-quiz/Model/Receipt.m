//
//  PaymentComment.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 17/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "Utils.h"
#import "Receipt.h"

@implementation Receipt

+ (instancetype)receiptFromDictionary:(NSDictionary *)data {
    Receipt *item = [self new];
    item.created = [Utils makeDateFromString:data[@"_created_at"]];
    item.uri = data[@"_uri"];
    item.body = data[@"body"];
    
    return item;
}

@end
