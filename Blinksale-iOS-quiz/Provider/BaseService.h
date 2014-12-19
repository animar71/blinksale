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
 The authorisation code to pass as a RFC2045-MIME variant of Base64. This will be used in the Authorization header
 */

@property (nonatomic, strong) NSString *authorisation;

/**
 The username that will be used for all the calls.
 */
@property (nonatomic, strong) NSString *userName;

/**
 Makes a GET request
 @param path - the path to be apended to the base url
 @param success - the success block that will be called, when the GET is ready
 @param fail - the fail block that is called when a fail event occurs in the GET
 */
- (void)getWithPath:(NSString *)path successBlock:(void (^)(id response))success failBlock:(void(^)(NSError *error))fail;


@end
