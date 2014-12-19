//
//  PaymentComment.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 17/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "Utils.h"
#import "PaymentComment.h"

@implementation PaymentComment

+ (instancetype)paymentCommentFromDictionary:(NSDictionary *)data {
    PaymentComment *item = [self new];
    item.created = [Utils makeDateFromString:data[@"_created_at"]];
    item.uri = data[@"_uri"];
    item.amount = data[@"amount"];
    item.author = data[@"author"];
    item.body = data[@"body"];
    item.removal = [data[@"removal"] isEqualToString:@"true"] ? YES : NO;
    
    return item;
}

@end
