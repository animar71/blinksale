//
//  ViewController.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 14/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    InvoiceManager *manager = [InvoiceManager new];
    manager.delegate = self;
    
    [manager getAllInvoices];
    [manager getInvoice:@"https://something.blinksale.com/invoices/1111111"];
    
    NSString *invoiceDetailsToBeUpdated = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?><invoice xmlns=\"https://www.blinksale.com/api\"><use_freight>false</use_freight></invoice>";
    [manager updateInvoice:[NSURL URLWithString:@"https://something.blinksale.com/invoices/1111111"] withDetails:invoiceDetailsToBeUpdated];
    
    ClientManager *clientManager = [ClientManager new];
    clientManager.delegate = self;
    [clientManager getAllClients];
    [clientManager getClient:@"https://something.blinksale.com/clients/1111111"];
    
    NSString *clientDetailsToBeUpdated = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?><client xmlns=\"https://www.blinksale.com/api\"><url>http://www.google.com</url></client>";
    [clientManager updateClient:[NSURL URLWithString:@"https://something.blinksale.com/clients/1111111"] withDetails:clientDetailsToBeUpdated];

    
}

#pragma mark - InvoiceManagerDelegate methods
- (void)invoiceManagerGotAllInvoices:(NSArray *)invoices {
    
}

- (void)invoiceManagerGotInvoice:(Invoice *)invoice {
    
}

- (void)invoiceManagerUpdatedInvoice:(Invoice *)invoice {
    
}

- (void)invoiceManagerWebserviceCallFailedWithError:(NSError *)error {
    
}

#pragma mark - ClientManagerDelegate Methods
- (void)clientManagerGotAllClients:(NSArray *)clients {
    
}

- (void)clientManagerGotClient:(Client *)client {
    
}

- (void)clientManagerUpdatedClient:(Client *)client {
    
}



@end
