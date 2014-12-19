//
//  ClientManager.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 18/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "Client.h"
#import "ClientManager.h"
#import "ClientsService.h"
#import "XMLDictionary.h"

@implementation ClientManager

- (void)getAllClients {
    // make the call to WS
    ClientsService *service = [ClientsService getServiceWithUserName:@"something@something.com" blinksaleId:@"something" andPassword:@"something"];;
    [service getClientsWithSuccessBlock:^(id response) {
        
        if ([self.delegate respondsToSelector:@selector(clientManagerGotAllClients:)]) {
            [self.delegate clientManagerGotAllClients:[self parseClientsFromParser:response]];
        }
    } failBlock:^(NSError *error) {
        if ([self.delegate respondsToSelector:@selector(clientManagerWebserviceCallFailedWithError:)]) {
            [self.delegate clientManagerWebserviceCallFailedWithError:error];
        }
    }];
}

- (void)getClient:(NSString *)invoiceURI {
    ClientsService *service = [ClientsService getServiceWithUserName:@"something@something.com" blinksaleId:@"something" andPassword:@"something"];
    
    [service getWithURI:[NSURL URLWithString:invoiceURI] successBlock:^(id response) {
        NSDictionary *responseDictionary = [[XMLDictionaryParser new] dictionaryWithParser:(NSXMLParser*)response];
        Client *item = [Client clientFromDictionary:responseDictionary];
        if ([self.delegate respondsToSelector:@selector(clientManagerGotClient:)]) {
            [self.delegate clientManagerGotClient:item];
        }
    } failBlock:^(NSError *error) {
        if ([self.delegate respondsToSelector:@selector(clientManagerWebserviceCallFailedWithError:)]) {
            [self.delegate clientManagerWebserviceCallFailedWithError:error];
        }    }];
}

- (void)updateClient:(NSURL *)uri withDetails:(NSString *)details {
    ClientsService *service = [ClientsService getServiceWithUserName:@"something@something.com" blinksaleId:@"something" andPassword:@"something"];
    
    [service postWithURI:uri body:details successBlock:^(id response) {
        NSDictionary *responseDictionary = [[XMLDictionaryParser new] dictionaryWithParser:(NSXMLParser*)response];
        Client *item = [Client clientFromDictionary:responseDictionary];
        if ([self.delegate respondsToSelector:@selector(clientManagerUpdatedClient:)]) {
            [self.delegate clientManagerUpdatedClient:item];
        }
    } failBlock:^(NSError *error) {
        if ([self.delegate respondsToSelector:@selector(clientManagerWebserviceCallFailedWithError:)]) {
            [self.delegate clientManagerWebserviceCallFailedWithError:error];
        }
    }];
}

#pragma mark - Private Methods
- (NSArray *)parseClientsFromParser:(NSXMLParser *)parser {
    NSMutableArray *clientsArray = [NSMutableArray new];
    
    //parse the response
    NSString *clientKey = @"client";
    NSDictionary *responseDictionary = [[XMLDictionaryParser new] dictionaryWithParser:parser];
    id clients = [responseDictionary objectForKey:clientKey];
    
    if ([clients isKindOfClass:[NSDictionary class]]) {
        [clientsArray addObject:[Client clientFromDictionary:clients]];
    } else if ([clients isKindOfClass:[NSArray class]]) {
        [(NSArray *)clients enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            [clientsArray addObject:[Client clientFromDictionary:obj]];
        }];
    }
    
    return clientsArray;
}


@end
