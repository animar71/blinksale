//
//  LateFee.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 17/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LateFee : NSObject

@property (nonatomic, strong) NSString *precentage;
@property (nonatomic, strong) NSString *amount;

+ (instancetype)lateFeeFromDictionary:(NSDictionary *)data;

@end
