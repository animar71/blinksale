//
//  BaseService.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 14/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseService : NSObject {
}

/**
 Creates a BaseService object that is initialized with an userName and password
 @param userName - used for login
 @param blinkSaleId - the id from the blinksale like example.blinksale.com
 @param password - password used for login
 @return an Baseservice object
 */
+ (instancetype)getServiceWithUserName:(NSString *)userName  blinksaleId:(NSString *)blinkSaleId andPassword:(NSString *)password;

/**
 Makes a GET request
 @param path - the path to be apended to the base url
 @param success - the success block that will be called, when the GET is ready
 @param fail - the fail block that is called when a fail event occurs in the GET
 */
- (void)getWithPath:(NSString *)path successBlock:(void (^)(id response))success failBlock:(void(^)(NSError *error))fail;

/**
  Makes a GET request
 @param uri the URI that is used to make the call
 @param success the success block
 @param fail the fail block
 */
- (void)getWithURI:(NSURL *)uri successBlock:(void (^)(id response))success failBlock:(void (^)(NSError *error))fail;

/**
 Makes a POST request
 @param uri the URI that is used to make the call
 @param success the success block
 @param fail the fail block
 */
- (void)postWithURI:(NSURL *)uri body:(NSString *)body successBlock:(void (^)(id response))success failBlock:(void (^)(NSError *error))fail;

@end
