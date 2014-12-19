//
//  InvoiceService.h
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 14/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"


@interface InvoiceService : BaseService

/**
 Returns all the invoices for the logged in user.
 */
- (void)getInvoicesWithSuccessBlock:(void (^)(id response))success failBlock:(void (^)(NSError *error))fail;

@end
