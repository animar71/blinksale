//
//  InvoiceManager.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 16/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Invoice;

@protocol InvoiceManagerDelegate <NSObject>

@required
- (void)invoiceManagerWebserviceCallFailedWithError:(NSError *)error;

@optional
- (void)invoiceManagerGotInvoice:(Invoice *)invoice;
- (void)invoiceManagerGotAllInvoices:(NSArray *)invoices;
- (void)invoiceManagerUpdatedInvoice:(Invoice *)invoice;

@end

@interface InvoiceManager : NSObject

@property (nonatomic, weak) id<InvoiceManagerDelegate> delegate;

/**
 It will get all invoices. In order to receive the success or fail callback, you need to implement invoiceManagerGotAllInvoices: and invoiceManagerWebserviceCallFailedWithError:
 */
- (void)getAllInvoices;

/**
 It will get an invoice and than notify the caller with the invoiceManagerGotInvoice: delegate method for success and for fail invoiceManagerWebserviceCallFailedWithError:
 */
- (void)getInvoice:(NSString *)invoiceURI;

/**
 Updates a given invoice with given details. The result will be returned by the success callback invoiceManagerUpdatedInvoice:. invoiceManagerWebserviceCallFailedWithError: is used for fail callback
 @param uri - the URI for the invoice
 @param details - the XML string that contains the changes that need to be made
 */
- (void)updateInvoice:(NSURL *)uri withDetails:(NSString *)details;

@end
