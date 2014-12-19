//
//  InvoiceService.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 14/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "InvoiceService.h"
#import "XMLDictionary.h"

@implementation InvoiceService

- (void)getInvoicesWithSuccessBlock:(void (^)(id resposne))success failBlock:(void (^)(NSError *error))fail {
    [self getWithPath:@"/clients" successBlock:^(id response) {
        NSDictionary *a = [[XMLDictionaryParser new] dictionaryWithParser:(NSXMLParser*)response];
        NSLog(@"%@", a);
    } failBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
