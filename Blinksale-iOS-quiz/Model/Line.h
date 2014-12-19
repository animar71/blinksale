//
//  Line.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 17/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Line : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *quantity;
@property (nonatomic, assign) BOOL isTaxed;
@property (nonatomic, strong) NSString *unitPrice;
@property (nonatomic, strong) NSString *units;

+ (instancetype)lineFromDictionary:(NSDictionary *)data;

@end
