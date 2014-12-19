//
//  ViewController.m
//  Blinksale-iOS-quiz
//
//  Created by Andrei Marcu on 14/12/14.
//  Copyright (c) 2014 animarsoftware. All rights reserved.
//

#import "ViewController.h"
#import "InvoiceService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    InvoiceService *service = [InvoiceService new];
    service.authorisation = @"Basic YW5pbWFyNzE6Y29jb2xpbm8=";
    service.userName = @"animar71";
    [service getInvoicesWithSuccessBlock:^(id response) {
        
    } failBlock:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
