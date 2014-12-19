//
//  InvoiceManager.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 16/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "Terms.h"
#import "Client.h"
#import "Invoice.h"
#import "XMLDictionary.h"
#import "InvoiceService.h"
#import "InvoiceManager.h"

@implementation InvoiceManager

- (void)getAllInvoices {
    // make the call to WS
    InvoiceService *service = [InvoiceService getServiceWithUserName:@"something@something.com" blinksaleId:@"something" andPassword:@"something"];
    [service getInvoicesWithSuccessBlock:^(id response) {
        
        if ([self.delegate respondsToSelector:@selector(invoiceManagerGotAllInvoices:)]) {
            [self.delegate invoiceManagerGotAllInvoices:[self parseInvoicesFromParser:response]];
        }
    } failBlock:^(NSError *error) {
        if ([self.delegate respondsToSelector:@selector(invoiceManagerWebserviceCallFailedWithError:)]) {
            [self.delegate invoiceManagerWebserviceCallFailedWithError:error];
        }
    }];
}

- (void)getInvoice:(NSString *)invoiceURI {
    InvoiceService *service = [InvoiceService getServiceWithUserName:@"something@something.com" blinksaleId:@"something" andPassword:@"something"];
    
    [service getWithURI:[NSURL URLWithString:invoiceURI] successBlock:^(id response) {
        NSDictionary *responseDictionary = [[XMLDictionaryParser new] dictionaryWithParser:(NSXMLParser*)response];
        Invoice *item = [Invoice invoiceFromDictionary:responseDictionary];
        if ([self.delegate respondsToSelector:@selector(invoiceManagerGotInvoice:)]) {
            [self.delegate invoiceManagerGotInvoice:item];
        }
    } failBlock:^(NSError *error) {
        if ([self.delegate respondsToSelector:@selector(invoiceManagerWebserviceCallFailedWithError:)]) {
            [self.delegate invoiceManagerWebserviceCallFailedWithError:error];
        }    }];
}

- (void)updateInvoice:(NSURL *)uri withDetails:(NSString *)details {
    InvoiceService *service = [InvoiceService getServiceWithUserName:@"something@something.com" blinksaleId:@"something" andPassword:@"something"];
    
    [service postWithURI:uri body:details successBlock:^(id response) {
        NSDictionary *responseDictionary = [[XMLDictionaryParser new] dictionaryWithParser:(NSXMLParser*)response];
         Invoice *item = [Invoice invoiceFromDictionary:responseDictionary];
        if ([self.delegate respondsToSelector:@selector(invoiceManagerUpdatedInvoice:)]) {
            [self.delegate invoiceManagerUpdatedInvoice:item];
        }
    } failBlock:^(NSError *error) {
        if ([self.delegate respondsToSelector:@selector(invoiceManagerWebserviceCallFailedWithError:)]) {
            [self.delegate invoiceManagerWebserviceCallFailedWithError:error];
        }
    }];
}

#pragma mark - Private Methods
- (NSArray *)parseInvoicesFromParser:(NSXMLParser *)parser {
    NSMutableArray *invoiceArray = [NSMutableArray new];
    
    //parse the response
    NSString *invoiceKey = @"invoice";
    NSDictionary *responseDictionary = [[XMLDictionaryParser new] dictionaryWithParser:parser];
    id invoices = [responseDictionary objectForKey:invoiceKey];
    
    if ([invoices isKindOfClass:[NSDictionary class]]) {
        [invoiceArray addObject:[Invoice invoiceFromDictionary:invoices]];
    } else if ([invoices isKindOfClass:[NSArray class]]) {
        [(NSArray *)invoices enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            [invoiceArray addObject:[Invoice invoiceFromDictionary:obj]];
        }];
    }
    
    return invoiceArray;
}

@end
