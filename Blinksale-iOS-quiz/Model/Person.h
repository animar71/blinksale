//
//  Person.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 19/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSURL *uri;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

+ (instancetype)personFromDictionary:(NSDictionary *)data;

@end
