//
//  Terms.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 16/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "Terms.h"

@implementation Terms

+ (instancetype)termsFromDictionary:(NSDictionary *)data {
    Terms *terms = [self new];
    terms.text = [data objectForKeyedSubscript:@"__text"];
    terms.dueDate = [data objectForKeyedSubscript:@"_due_date"];
    
    return terms;
}

@end
