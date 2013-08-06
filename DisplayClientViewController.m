//
//  DisplayClientViewController.m
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/6/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import "DisplayClientViewController.h"
#import "AppDelegate.h"

@interface DisplayClientViewController ()

@end

@implementation DisplayClientViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    //NSString *clientName=(NSString *)[self.currentClient clientFirstName];
    //self.title=(@"Client:%@", clientName);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.firstNameField.text=[self.currentClient clientFirstName];
    self.lastNameField.text=[self.currentClient clientLastName];
    self.emailField.text=[self.currentClient clientEmail];
    self.phoneField.text=[self.currentClient clientPhone];
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    self.currentClient.clientFirstName =self.firstNameField.text;
    self.currentClient.clientLastName=self.lastNameField.text;
    self.currentClient.clientEmail=self.emailField.text;
    self.currentClient.clientPhone=self.phoneField.text;
    
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    [myApp saveContext];
                        
}
@end
