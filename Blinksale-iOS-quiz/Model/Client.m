//
//  Client.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 16/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "Utils.h"
#import "Client.h"
#import "Invoice.h"
#import "Person.h"

@implementation Client

- (instancetype)init {
    self = [super init];
    if (self) {
        self.invoices = [NSMutableArray new];
        self.people = [NSMutableArray new];
    }
    
    return self;
}

+ (instancetype)clientFromDictionary:(NSDictionary *)data {
    Client *client = [self new];
    client.createDate = [Utils makeDateFromString:data[@"_created_at"]];
    client.updatedAt = [Utils makeDateFromString:data[@"_updated_at"]];
    client.uri = (data[@"__text"] == nil) ? data [@"_uri"] : data[@"__text"];
    client.address1 = data[@"address1"];
    client.address2 = data[@"address2"];
    client.city = data[@"city"];
    client.country = data[@"country"];
    client.fax = data[@"fax"];
    
    //Add invoices
    NSDictionary *invoicesDictionary = data[@"invoices"];
    client.invoicesURI = invoicesDictionary[@"_uri"];
    id invoicesData = invoicesDictionary[@"invoice"];
    if ([invoicesData isKindOfClass:[NSDictionary class]]) {
        [client.invoices addObject:[Invoice invoiceFromDictionary:invoicesData]];
    } else if([invoicesData isKindOfClass:[NSArray class]]) {
        [invoicesData enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            [client.invoices addObject:[Invoice invoiceFromDictionary:obj]];
        }];
    }
    
    client.name = (data[@"_name"] == nil) ? data [@"name"] : data[@"_name"];
    
    //Add people
    NSDictionary *peopleDictionary = data[@"people"];
    client.peopleURI = peopleDictionary[@"_uri"];
    id peopleData = peopleDictionary[@"person"];
    if ([peopleData isKindOfClass:[NSDictionary class]]) {
        [client.people addObject:[Person personFromDictionary:peopleData]];
    } else if ([peopleData isKindOfClass:[NSArray class]]) {
        [peopleData enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            [client.people addObject:[Person personFromDictionary:obj]];
        }];
    }
    
    client.phone = data[@"phone"];
    client.state = data[@"state"];
    client.token = data[@"token"];
    client.clietnURL = data[@"url"];
    client.zip = data[@"zip"];
    
    return client;
}

@end
