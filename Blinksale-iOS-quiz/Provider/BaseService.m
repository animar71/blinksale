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

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *blinkSaleId;

@end


@implementation BaseService

+ (instancetype)getServiceWithUserName:(NSString *)userName blinksaleId:(NSString *)blinkSaleId andPassword:(NSString *)password {
    BaseService *instance = [self new];
    instance.userName = userName;
    instance.password = password;
    instance.blinkSaleId = blinkSaleId;
    
    return instance;
}

#pragma mark - Public methods
- (void)getWithPath:(NSString *)path successBlock:(void (^)(id response))success failBlock:(void(^)(NSError *error))fail {
    NSMutableURLRequest *urlRequest = [self getGETURLRequestWithPath:path];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    
    AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:urlRequest success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
    }];
    
    [self setupRequestOperation:operation];
    [operation start];
}

- (void)getWithURI:(NSURL *)uri successBlock:(void (^)(id))success failBlock:(void (^)(NSError *))fail {
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:uri];
    [urlRequest setValue:acceptType forHTTPHeaderField:@"Accept"];
    [urlRequest setHTTPMethod:@"GET"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    
    AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:urlRequest success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
    }];
    
    [self setupRequestOperation:operation];
    [operation start];
}

- (void)postWithURI:(NSURL *)uri body:(NSString *)body successBlock:(void (^)(id))success failBlock:(void (^)(NSError *))fail {
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:uri];
    [urlRequest setValue:acceptType forHTTPHeaderField:@"Accept"];
    [urlRequest setValue:acceptType forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPMethod:@"PUT"];
    [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    
    AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:urlRequest success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
    }];
    
    [self setupRequestOperation:operation];

    [operation start];
}
    
#pragma mark - private methods

/**
 Adds the credentials, accetableContentTypes and response serializer to the RequestOperation
 */
- (void)setupRequestOperation:(AFHTTPRequestOperation *)operation {
    NSURLCredential *credential = [NSURLCredential credentialWithUser:self.userName password:self.password persistence:NSURLCredentialPersistenceNone];
    [operation setCredential:credential];
    [operation setResponseSerializer:[AFXMLParserResponseSerializer new]];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/vnd.blinksale+xml"];
}

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
 Creates a NSMutableURLRequest that is composed of the base URL and the path. The headder has the Authorisation and Accept keys set.
 @param path - the path appended to the base URL
 @return NSMUtableURLReqest - the url request as described above
 */
- (NSMutableURLRequest *)getURLRequestWithPath:(NSString *)path {
    NSURL *baseUrl = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@.blinksale.com", self.blinkSaleId]];
    NSURL *url = [NSURL URLWithString:path relativeToURL:baseUrl];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setValue:acceptType forHTTPHeaderField:@"Accept"];
    
    return urlRequest;
}

@end
