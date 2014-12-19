//
//  ClientsService.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 18/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "ClientsService.h"

@implementation ClientsService

- (void)getClientsWithSuccessBlock:(void (^)(id resposne))success failBlock:(void (^)(NSError *error))fail {
    [self getWithPath:@"/clients" successBlock:^(id response) {
        success(response);
        
    } failBlock:^(NSError *error) {
        fail(error);
    }];
}

@end
