//
//  Comment.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 17/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "Utils.h"
#import "Comment.h"

@implementation Comment

+ (instancetype)commnetFromDictionary:(NSDictionary *)data {
    Comment *item = [self new];
    
    item.createdAt = [Utils makeDateFromString:[data objectForKey:@"_created_at"]];
    item.uri = [data objectForKey:@"_uri"];
    item.author = [data objectForKey:@"author"];
    item.body = [data objectForKey:@"body"];
    
    return item;
}

@end
