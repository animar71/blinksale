//
//  ClientManager.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 18/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Client;

@protocol ClientManagerDelegate <NSObject>
@required
- (void)clientManagerWebserviceCallFailedWithError:(NSError *)error;

@optional
- (void)clientManagerGotClient:(Client *)client;
- (void)clientManagerGotAllClients:(NSArray *)clients;
- (void)clientManagerUpdatedClient:(Client *)client;

@end


@interface ClientManager : NSObject

@property (nonatomic, weak) id<ClientManagerDelegate> delegate;

/**
 It will get all clients. In order to receive the success or fail callback, you need to implement clientManagerGotAllClients: and clientManagerWebserviceCallFailedWithError:
 */
- (void)getAllClients;

/**
 It will get an client and than notify the caller with the clientManagerGotClient: delegate method for success and for fail clientManagerWebserviceCallFailedWithError:
 */
- (void)getClient:(NSString *)clientURI;

/**
 Updates a given client with given details. The result will be returned by the success callback clientManagerUpdatedClient:. clientManagerWebserviceCallFailedWithError: is used for fail callback
 @param uri - the URI for the client
 @param details - the XML string that contains the changes that need to be made
 */
- (void)updateClient:(NSURL *)uri withDetails:(NSString *)details;

@end
