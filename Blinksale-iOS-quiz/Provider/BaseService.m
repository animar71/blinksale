//
//  BaseService.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 14/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "BaseService.h"
#import <NSData+Base64/NSData+Base64.h>
#import <AFNetworking.h>

NSString * const acceptType = @"application/vnd.blinksale+xml";

@interface BaseService()

@end


@implementation BaseService

#pragma mark - Public methods
- (void)getWithPath:(NSString *)path successBlock:(void (^)(id response))success failBlock:(void(^)(NSError *error))fail {
    NSMutableURLRequest *urlRequest = [self getGETURLRequestWithPath:path];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://examplewebsite.com"]];
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
//    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"animar71@gmail.com" password:@"cocolino"];
    
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"animar71@gmail.com" password:@"cocolino" persistence:NSURLCredentialPersistenceNone];
    
    AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:urlRequest success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        fail(error);
    }];
    
    [operation setCredential:credential];
    [operation setResponseSerializer:[AFXMLParserResponseSerializer new]];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/vnd.blinksale+xml"];
    
    [operation start];
}
    
#pragma mark - private methods
/**
 Calls the getURLRequestWithPath: and sets the HTTP method to GET
 @param path - the path apended to the base URL
 @return NSMutableURLRequest a GET URLRequest
 */
- (NSMutableURLRequest *)getGETURLRequestWithPath:(NSString *)path {
    NSMutableURLRequest *urlRequest = [self getURLRequestWithPath:path];
    [urlRequest setHTTPMethod:@"GET"];
    
    return urlRequest;
}

/**
 Calls the getURLRequestWithPath: and sets the HTTP method to POST
 @param path - the path apended to the base URL
 @return NSMutableURLRequest a POST URLRequest
 */
- (NSMutableURLRequest *)getPOSTURLRequestWithPath:(NSString *)path {
    NSMutableURLRequest *urlRequest = [self getURLRequestWithPath:path];
    [urlRequest setHTTPMethod:@"POST"];
    
    return urlRequest;
}


/**
 Creates a NSMutableURLRequest that is composed of the base URL and the path. The headder has the Authorisation and Accept keys set.
 @param path - the path appended to the base URL
 @return NSMUtableURLReqest - the url request as described above
 */
- (NSMutableURLRequest *)getURLRequestWithPath:(NSString *)path {
    NSURL *baseUrl = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@.blinksale.com", self.userName]];
    NSURL *url = [NSURL URLWithString:path relativeToURL:baseUrl];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setValue:acceptType forHTTPHeaderField:@"Accept"];
    
    return urlRequest;
}

@end
