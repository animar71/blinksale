//
//  Invoice.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 16/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Client, Terms, LateFee;

@interface Invoice : NSObject

@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *surplus;
@property (nonatomic, strong) NSString *total;
@property (nonatomic, strong) NSString *totalDue;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, strong) NSURL *uri;
@property (nonatomic, strong) Client *client;
@property (nonatomic, strong) NSURL *commentsURI;
@property (nonatomic, strong) NSMutableArray *comments;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *deliveries;
@property (nonatomic, strong) NSString *freight;
@property (nonatomic, assign) BOOL isPaymentLinkIncluded;
@property (nonatomic, strong) LateFee *lateFee;
@property (nonatomic, strong) NSString *linesTotal;
@property (nonatomic, strong) NSMutableArray *lines;
@property (nonatomic, strong) NSString *notes;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSURL *paymentCommentURI;
@property (nonatomic, strong) NSMutableArray *paymentComments;
@property (nonatomic, strong) NSURL *paymentURI;
@property (nonatomic, strong) NSMutableArray *payments;
@property (nonatomic, strong) NSString *poNumber;
@property (nonatomic, strong) NSURL *receiptURI;
@property (nonatomic, strong) NSMutableArray *receipts;
@property (nonatomic, strong) NSString *taxPrecentage;
@property (nonatomic, strong) NSString *taxAmount;
@property (nonatomic, strong) Terms *terms;
@property (nonatomic, assign) BOOL useFreight;
@property (nonatomic, assign) BOOL useTax;


+ (instancetype)invoiceFromDictionary:(NSDictionary *)data;

@end

