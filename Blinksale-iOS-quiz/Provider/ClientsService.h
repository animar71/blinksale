//
//  ClientsService.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 18/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"

@interface ClientsService : BaseService

/**
 Makes a GET call in order to get all the clients for the logged in user.
 @param success the success block
 @param fail the fail block
 */
- (void)getClientsWithSuccessBlock:(void (^)(id response))success failBlock:(void (^)(NSError *error))fail;

@end
