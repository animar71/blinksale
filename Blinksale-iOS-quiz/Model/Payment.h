//
//  PaymentComment.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 17/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Payment : NSObject

@property (nonatomic, strong) NSDate *created;
@property (nonatomic, strong) NSURL *uri;
@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *paymentMethod;

+ (instancetype)paymentFromDictionary:(NSDictionary *)data;

@end
