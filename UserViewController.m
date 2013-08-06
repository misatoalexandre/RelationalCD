//
//  UserViewController.m
//  RelationalCD
//
//  Created by Misato Tina Alexandre on 8/5/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import "UserViewController.h"
#import "AppDelegate.h"
#import "User.h"

@interface UserViewController ()

@end

@implementation UserViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"User Info";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.save.enabled=NO;
	// Do any additional setup after loading the view.
    self.firstNameField.text=[self.theUser userFirstName];
    self.lastNameField.text=[self.theUser userLastName];
    self.businessNameField.text=[self.theUser businessName];
    self.emailField.text=[self.theUser userEmail];
    self.phoneField.text=[self.theUser phone];
    self.password.text=[self.theUser password];
    
    self.firstNameField.borderStyle=UITextBorderStyleNone;
    self.lastNameField.borderStyle =UITextBorderStyleNone;
    self.businessNameField.borderStyle=UITextBorderStyleNone;
    self.emailField.borderStyle=UITextBorderStyleNone;
    self.phoneField.borderStyle=UITextBorderStyleNone;
    self.password.borderStyle=UITextBorderStyleNone;
    
    self.firstNameField.enabled=NO;
    self.lastNameField.enabled=NO;
    self.businessNameField.enabled=NO;
    self.emailField.enabled=NO;
    self.phoneField.enabled=NO;
    self.password.enabled=NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)save:(id)sender {
    
    AppDelegate *delegate=[[UIApplication sharedApplication]delegate];
    self.managedObjectContext=delegate.managedObjectContext;
    NSManagedObjectContext *context =self.managedObjectContext;
    
    
    //self.theUser=(User*)[NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    self.theUser =(User*) [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    
    [self.theUser setUserFirstName:self.firstNameField.text];
    [self.theUser setUserLastName:self.lastNameField.text];
    [self.theUser setBusinessName:self.businessNameField.text];
    [self.theUser setUserEmail:self.emailField.text];
    [self.theUser setPhone:self.phoneField.text];
    [self.theUser setPassword:self.password.text];
    
    
    NSError *error =nil;
    
    if (![context save:&error]) {
        NSLog(@"Error! %@", error);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error Saving"message:@"Didn't save" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    UIAlertView *savedAlert=[[UIAlertView alloc]initWithTitle:@"Saved" message:@"info saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [savedAlert show];
    
    self.firstNameField.borderStyle=UITextBorderStyleNone;
    self.lastNameField.borderStyle =UITextBorderStyleNone;
    self.businessNameField.borderStyle=UITextBorderStyleNone;
    self.emailField.borderStyle=UITextBorderStyleNone;
    self.phoneField.borderStyle=UITextBorderStyleNone;
    self.password.borderStyle=UITextBorderStyleNone;
    
    self.firstNameField.enabled=NO;
    self.lastNameField.enabled=NO;
    self.businessNameField.enabled=NO;
    self.emailField.enabled=NO;
    self.phoneField.enabled=NO;
    self.password.enabled=NO;
    
    //Display the saved user info.
    self.firstNameField.text=[self.theUser userFirstName];
    self.lastNameField.text=[self.theUser userLastName];
    self.businessNameField.text=[self.theUser businessName];
    self.emailField.text=[self.theUser userEmail];
    self.phoneField.text=[self.theUser phone];
    self.password.text=[self.theUser password];
    
    //tab bar states. 
    self.edit.enabled=YES;
    self.save.enabled=NO;
}

- (IBAction)cancel:(id)sender {
    
    self.save.enabled=YES;
    self.edit.enabled=NO;
    self.firstNameField.borderStyle=UITextBorderStyleRoundedRect;
    self.lastNameField.borderStyle =UITextBorderStyleRoundedRect;
    self.businessNameField.borderStyle=UITextBorderStyleRoundedRect;
    self.emailField.borderStyle=UITextBorderStyleRoundedRect;
    self.phoneField.borderStyle=UITextBorderStyleRoundedRect;
    self.password.borderStyle=UITextBorderStyleRoundedRect;
    
    self.firstNameField.enabled=YES;
    self.lastNameField.enabled=YES;
    self.businessNameField.enabled=YES;
    self.emailField.enabled=YES;
    
    self.phoneField.enabled=YES;
    self.password.enabled=YES;
    
}

    

@end
