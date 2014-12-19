blinksale
=========
In the ViewController.m in view did load mehtod blinksale, client and invoice ids must be provided must be provided.
The blinksale and invoice ids must be provided for getInvoice: and updateInvoice: methods.
The blinksale and client ids must be provided for getClient: and updateClient: methods.

Other things that need to be added are: blinksale id, username and password. These must be added in InvoiceManager.m and ClientManager.m where the service is instantiated.

After this setup is made, simply run he application and all the data requested will be available modeled in the callback delegate methods from ViewController.m

For invoice: 
- (void)invoiceManagerGotAllInvoices:(NSArray *)invoices {
    
}

- (void)invoiceManagerGotInvoice:(Invoice *)invoice {
    
}

- (void)invoiceManagerUpdatedInvoice:(Invoice *)invoice {
    
}

- (void)invoiceManagerWebserviceCallFailedWithError:(NSError *)error {
    
}

For client:
- (void)clientManagerGotAllClients:(NSArray *)clients {
    
}

- (void)clientManagerGotClient:(Client *)client {
    
}

- (void)clientManagerUpdatedClient:(Client *)client {
    
}

- (void)clientManagerWebserviceCallFailedWithError:(NSError *)error {
    
}
