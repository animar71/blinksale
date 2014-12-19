//
//  Comment.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 17/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSURL *uri;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *body;

+ (instancetype)commnetFromDictionary:(NSDictionary *)data;

@end
