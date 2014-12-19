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
 Makes a GET call in order to get all the invoices for the logged in user.
 @param success the success block
 @param fail the fail block
 */
- (void)getInvoicesWithSuccessBlock:(void (^)(id response))success failBlock:(void (^)(NSError *error))fail;

@end
