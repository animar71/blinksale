//
//  Utils.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 17/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSDate *)makeDateFromString:(NSString *)stringDate {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
    return [dateFormatter dateFromString:stringDate];
}

@end
