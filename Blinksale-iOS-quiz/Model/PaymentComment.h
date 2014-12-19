//
//  PaymentComment.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 17/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaymentComment : NSObject

@property (nonatomic, strong) NSDate *created;
@property (nonatomic, strong) NSURL *uri;
@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, assign) BOOL removal;

+ (instancetype)paymentCommentFromDictionary:(NSDictionary *)data;

@end
