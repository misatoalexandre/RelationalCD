//
//  ServiceDetailViewController.m
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 7/28/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import "ServiceDetailViewController.h"
#import "AppDelegate.h"

@interface ServiceDetailViewController ()

@end

@implementation ServiceDetailViewController

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
    self.titleField.text=[self.currentService serviceTitle];
    self.descriptionField.text=[self.currentService serviceDescription];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)edit:(id)sender {
    self.titleField.enabled=YES;
    self.descriptionField.editable=YES;
    
    self.titleField.borderStyle=UITextBorderStyleRoundedRect;
  
    self.editButton.hidden=YES;
    self.doneButton.hidden=NO;
    
}

- (IBAction)done:(id)sender {
    self.titleField.enabled=NO;
    self.descriptionField.editable=NO;
    
    self.titleField.borderStyle=UITextBorderStyleNone;
    
    self.editButton.hidden=NO;
    self.doneButton.hidden=YES;
    
    self.currentService.serviceTitle=self.titleField.text;
    self.currentService.serviceDescription=self.descriptionField.text;
    
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [myApp saveContext];
    
}
@end
