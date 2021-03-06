//
//  AddClientViewController.m
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/6/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import "AddClientViewController.h"

@interface AddClientViewController ()

@end

@implementation AddClientViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    [self.currentClient setClientFirstName:self.firstNameField.text];
    [self.currentClient setClientLastName:self.lastNameField.text];
    [self.currentClient setClientEmail:self.emailField.text];
    [self.currentClient setClientPhone:self.phoneField.text];
    
    [self.delegate addClientViewControllerDidSave];
}

- (IBAction)cancel:(id)sender {
    [self.delegate addClientViewControllerDidCancel:self.currentClient];
}
@end
