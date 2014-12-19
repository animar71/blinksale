//
//  Terms.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 16/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Terms : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *dueDate;

+ (instancetype)termsFromDictionary:(NSDictionary *)data;

@end
