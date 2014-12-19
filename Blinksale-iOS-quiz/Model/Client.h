//
//  Client.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 16/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Client : NSObject

@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, strong) NSURL *uri;
@property (nonatomic, strong) NSString *address1;
@property (nonatomic, strong) NSString *address2;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *fax;
@property (nonatomic, strong) NSURL *invoicesURI;
@property (nonatomic, strong) NSMutableArray *invoices;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSURL *peopleURI;
@property (nonatomic, strong) NSMutableArray *people;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSURL *clietnURL;
@property (nonatomic, strong) NSString *zip;


+ (instancetype)clientFromDictionary:(NSDictionary *)data;

@end
