//
//  Invoice.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 16/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "Utils.h"
#import "Terms.h"
#import "Client.h"
#import "Invoice.h"
#import "Comment.h"
#import "LateFee.h"
#import "Line.h"
#import "PaymentComment.h"
#import "Payment.h"
#import "Receipt.h"

@implementation Invoice

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.comments = [NSMutableArray new];
        self.lines = [NSMutableArray new];
        self.paymentComments = [NSMutableArray new];
        self.payments = [NSMutableArray new];
        self.receipts = [NSMutableArray new];
    }
    
    return self;
}

+ (instancetype)invoiceFromDictionary:(NSDictionary *)data {
    Invoice *invoice = [self new];
    
    if (![data isKindOfClass:[NSDictionary class]]) {
        return invoice;
    }
    
    invoice.createDate = [Utils makeDateFromString:[data objectForKey:@"_created_at"]];
    invoice.status = [data objectForKey:@"_status"];
    invoice.surplus = [data objectForKey:@"_surplus"];
    invoice.total = [data objectForKey:@"_total"];
    invoice.totalDue = [data objectForKey:@"_total_due"];
    invoice.updatedAt = [Utils makeDateFromString:[data objectForKey:@"_updated_at"]];
    invoice.uri = [data objectForKey:@"_uri"];
    invoice.client = [Client clientFromDictionary:[data objectForKey:@"client"]];
    
    // Add the comments
    NSDictionary *comments = [data objectForKey:@"comments"];
    invoice.commentsURI = [comments objectForKey:@"_uri"];
    id commentsData = [comments objectForKey:@"comment"];
    if ([commentsData isKindOfClass:[NSDictionary class]]) {
        [invoice.comments addObject:[Comment commnetFromDictionary:commentsData]];
    } else if([commentsData isKindOfClass:[NSArray class]]) {
        [commentsData enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            [invoice.comments addObject:[Comment commnetFromDictionary:obj]];
        }];
    }
    
    invoice.currency = [data objectForKey:@"currency"];
    invoice.date = [data objectForKey:@"date"];
    
    //Add deliveries
    NSDictionary *deliveries = [data objectForKey:@"deliveries"];
    invoice.deliveries = [deliveries objectForKey:@"_uri"];
    
    invoice.freight = [data objectForKey:@"freight"];
    invoice.isPaymentLinkIncluded = [[data objectForKey:@"include_payment_link"] isEqualToString:@"true"] ? YES : NO;
    invoice.lateFee = [LateFee lateFeeFromDictionary:[data objectForKey:@"late_fee"]];
    
    //Add lines
    NSDictionary *linesDictionary = [data objectForKey:@"lines"];
    invoice.linesTotal = [linesDictionary objectForKey:@"_total"];
    id lineData = [linesDictionary objectForKey:@"line"];
    if ([lineData isKindOfClass:[NSDictionary class]]) {
        [invoice.lines addObject:[Line lineFromDictionary:lineData]];
    } else {
        [lineData enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            [invoice.lines addObject:[Line lineFromDictionary:obj]];
        }];
    }
    
    invoice.notes = [data objectForKey:@"notes"];
    invoice.number = [data objectForKey:@"number"];
    
    //Add payment comments
    NSDictionary *paymentCommentsDictionary = [data objectForKey:@"payment_comments"];
    invoice.paymentCommentURI = [paymentCommentsDictionary objectForKey:@"_uri"];
    id paymentCommentsData = [paymentCommentsDictionary objectForKey:@"payment_comment"];
    if ([paymentCommentsData isKindOfClass:[NSDictionary class]]) {
        [invoice.paymentComments addObject:[PaymentComment paymentCommentFromDictionary:paymentCommentsData]];
    } else if([paymentCommentsData isKindOfClass:[NSArray class]]) {
        [paymentCommentsData enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            [invoice.paymentComments addObject:[PaymentComment paymentCommentFromDictionary:obj]];
        }];
    }
    
    //Add payments
    NSDictionary *paymentsDictionary = [data objectForKey:@"payments"];
    invoice.paymentURI = [paymentsDictionary objectForKey:@"_uri"];
    id paymentsData = [paymentsDictionary objectForKey:@"payment"];
    if ([paymentsData isKindOfClass:[NSDictionary class]]) {
        [invoice.payments addObject:[Payment paymentFromDictionary:paymentsData]];
    } else if([paymentsData isKindOfClass:[NSArray class]]) {
        [paymentsData enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            [invoice.payments addObject:[Payment paymentFromDictionary:obj]];
        }];
    }
    
    invoice.poNumber = [data objectForKey:@"po_number"];
    
    //Add receipts
    NSDictionary *receiptsDictionary = [data objectForKey:@"receipts"];
    invoice.receiptURI = [receiptsDictionary objectForKey:@"_uri"];
    id receiptsData = [receiptsDictionary objectForKey:@"receipt"];
    if ([receiptsData isKindOfClass:[NSDictionary class]]) {
        [invoice.receipts addObject:[Receipt receiptFromDictionary:receiptsData]];
    } else if([receiptsData isKindOfClass:[NSArray class]]) {
        [receiptsData enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            [invoice.receipts addObject:[Receipt receiptFromDictionary:obj]];
        }];
    }
    
    //Add tax
    NSDictionary *taxDictionary = [data objectForKey:@"tax"];
    invoice.taxPrecentage = [taxDictionary objectForKey:@"__text"];
    invoice.taxAmount = [taxDictionary objectForKey:@"_amount"];
    
    invoice.terms = [Terms termsFromDictionary:[data objectForKey:@"terms"]];
    invoice.useFreight = [[data objectForKey:@"use_freight"] isEqualToString:@"true"] ? YES : NO;
    invoice.useTax = [[data objectForKey:@"use_tax"] isEqualToString:@"true"] ? YES : NO;
    
    return invoice;
}

@end
